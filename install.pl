#!/usr/bin/perl

use strict; use warnings;
use Cwd; use File::Copy;
use Getopt::Long;
use File::Temp qw/ tempdir /;
use sigtrap 'handler' => \&cleanup, 'normal-signals';


# Names used by all functions
my $app;
my $name;
my $version;
# Temporary directories unless otherwise specified
my $installdir = "/data/apps";
my $moduledir  = "/data/apps/Modules/3.2.10/modulefiles";
my $builddir   = tempdir(CLEANUP => 1);
# False unless otherwise specified
my $verbose    = 0;
my $clean      = 0;
my $superclean = 0;


# Cleans up if a signal is caught
sub cleanup
{
  if(-d "$builddir/$app")
  {
    `rm -rf $builddir/$app`;
  }
  die;
}

# Prints a help message
sub help
{
  (my $help_message = q{
    Usage:
      install_all.pl [OPTION...] [APPNAME_APPVERSION]
      install_all.pl [OPTION...]
    Options:
      --verbose: print out a lot more
      --installdir: define the installation directory
      --moduledir:  define the installation directory for modules
      --builddir:   define the temporary build directory
      --clean:      overwrite installed applications
      --superclean: delete installed applications and then install

    }) =~ s/^ {4}//mg;
  die "$help_message";
}


# Splits the name by underscores to determine appname and version
sub split_name
{
  if($app =~ /([^_]*)_(.*)/)
  {
    my $appname = $1; my $appversion = $2;
    return ($appname, $appversion);
  }
  else
  {
    print "FATAL ERROR: Could not find an underscore in '$app'. Rename your tarball.\n";
    exit;
  }
}


# Parses out the "module load" lines to return a list of dependencies
sub get_deps
{
  my @deps;
  my $filename = "scripts/$name/$version.sh";
  open (FILE, $filename) or die $!;
  while(<FILE>)
  {
    next unless /^module load (\w+)\/(\S+)/;
    push(@deps, "$1\_$2");
  }
  close FILE;
  @deps;
}


# Installs the modulefile and .newton file
sub install_module
{
  # Copy the modulefile and .newton file into the proper directories
  mkdir "$moduledir/$name";
  `touch $installdir/$name/$version/.newton &> /dev/null`;
  `cp scripts/$name/$version $moduledir/$name/ &> /dev/null`;

  # If no such modulefile, say so
  if($? != 0)
  {
    print "Installed NON-MODULE '$name/$version'\n\n";
  }
  else
  {
    print "Installed MODULE '$name/$version'\n\n";
  }
}


##############################
#          BUILD             #
##############################
sub build
{
  # Set application-specific environment variables
  $ENV{INSTALLDIR} = "$installdir";
  $ENV{APPNAME} = "$name";
  $ENV{VERSION} = "$version";
  $ENV{APPDIR}  = "$installdir/$name/$version";

  # Remove the previous installation if superclean is set
  if($superclean)
  {
    print "--Explicitly deleting '$installdir/$name/$version' before building.\n" if $verbose;
    `rm -rf $installdir/$name/$version &> /dev/null`;
  }

  # Now build the application if it's not already installed
  if($clean or not -e "$installdir/$name/$version/.newton")
  {
    # Remove previous attempts to build
    `rm -rf $builddir/$app &> /dev/null`;

    # Copy the tarball
    print "--Copying the tarball '$app'.\n" if $verbose;
    `cp -arf tarballs/$app $builddir`;
    if ($? != 0) { `echo "Couldn't find tarball for $app." >> error.log`; return 1; }

    # Copy the build script
    print "--Copying the script '$app'.\n" if $verbose;
    `cp scripts/$name/$version.sh $builddir/$app/$app.sh`;
    if ($? != 0) { `echo "Couldn't find build script for $app" >> error.log`; return 1; }

    # Run the build script
    print "--Running the build script '$app.sh'.\n" if $verbose;
    my $dir = cwd();
    chdir("$builddir/$app");
    `./$app.sh &>$dir/logs/$app.log`;
    chdir($dir);

    # If the build script died
    if (($? != 0) or (not -e "$installdir/$name/$version"))
    {
      `echo "The build script failed for $app" >> error.log`; return 1;
    }

    # Remove the build directory once finished
    `rm -rf $builddir/$app`;

    return 0;
  }
  else
  {
    print "--It's already installed! Not building '$app'.\n" if $verbose;
    return 0;
  }
}


################################
#         INSTALL ALL          #
################################
sub newton_install_all
{
  my $topdir = cwd();
  my ($inarow, @failedapps, %installed) = (1);

  chdir("tarballs");
  my @apps = glob "*";
  chdir($topdir);

  # Goes through all the applications
  while(@apps and $inarow < @apps)
  {
    $app = shift @apps;
    ($name, $version) = split_name();
    if($? == 1) { next; }
    print "$name\_$version\n" if $verbose;

    # Check for the existence of the corresponding script
    unless(-e "scripts/$name/$version.sh")
    {
      print "WARNING: Cannot find the build script for '$name/$version'.\n\n";
      next;
    }

    # Get a list of all dependencies that have not been installed during this run
    my @missingdeps = grep {not $installed{$_}} get_deps();

    # Push the application to end of build list if it has unmet dependencies
    if(@missingdeps)
    {
      $inarow++;
      push @apps, $app;
      print "\n";
      next;
    }

    # Checks to see if the build succeeded
    if(build() != 0)
    {
      print "Building $app failed.\n\n";
      push( @failedapps, $app );
      `rm $installdir/$name/$version/.newton &> /dev/null`;
    }
    else
    {
      $inarow = 1;
      install_module();
      $installed{$app} = 1;
    }
  }

  # Print out failed applications and unmet dependencies
  print "FAILED APPS:\n";
  print "$_\n" for @failedapps;

  print "UNRESOLVABLE DEPENDENCIES:\n";
  foreach(@apps)
  {
    print "  * $_ depends on: \n";
    my @deps = get_deps $_;
    foreach(@deps)
    {
      print "      $_ ";
      print "(installed) " if $installed{$_};
      print "\n";
    }
    print "\n";
  }
}


############################
#      INSTALL ONE         #
############################
sub newton_install_one
{
  # Set the globals defining the application that we're installing
  $app = $ARGV[0];
  ($name, $version) = split_name();

  # Build the application and check for success
  if(build() != 0)
  {
    print "Building $app failed\n\n";
  }
  else
  {
    `touch $installdir/$name/$version/.newton &> /dev/null`;
    install_module();
  }
}


############################
#          SETUP           #
############################
sub setup
{
  # Get command line options if supplied
  GetOptions ('i|installdir=s' => \$installdir,
              'b|builddir=s'   => \$builddir,
              'm|moduledir=s'  => \$moduledir,
              'v|verbose'      => \$verbose,
              'c|clean'        => \$clean,
              's|superclean'   => \$superclean
             )
  or help();
  
  if(defined $installdir) { die "Directory \"$installdir\" doesn't exist" unless -d "$installdir"; }
  if(defined $builddir)   { die "Directory \"$builddir\" doesn't exist" unless -d "$builddir"; }
  if(defined $moduledir)  { die "Directory \"$moduledir\" doesn't exist" unless -d "$moduledir"; }

  die "Directory \"tarballs\" doesn't exist" unless -d "tarballs";
  die "Directory \"scripts\" doesn't exist" unless -d "scripts";
  die "Directory \"logs\" doesn't exist" unless -d "logs";

  print "Installing applications in:    '$installdir'\n";
  print "Using this directory to build: '$builddir'\n";
  print "Installing modules to:         '$moduledir'\n";
}


##############################
setup();
if(@ARGV)
{
  print "Installing $ARGV[0]\n";
  newton_install_one();
} 
else 
{
  print "Installing all applications.\n\n";
  newton_install_all();
}
