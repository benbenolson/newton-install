#!/usr/bin/perl
#
# Significant changes by Geri:
#  - Moved main logic up to and removed setup()
#  - Added much more error checking in the form of execute()
#  - Centralized error reporting into error()
#  - Changed cleanup() to use File::Temp::cleanup()
#  - Added vprint() for optional diagnostic printouts
#  - Removed all global variables that are not static parameters
#  - Moved help() text
#  - Simplified testing of directory existance
#  - Moved install_modules() into build()
#  - Simlified logic in some places
#
use strict;
use warnings;
use Cwd;
use File::Copy;
use Getopt::Long;
use File::Temp 'tempdir';
use sigtrap 'handler' => \&cleanup, 'normal-signals';

# Temporary directories unless otherwise specified
my $installdir = "/data/apps";
my $moduledir  = "/data/apps/Modules/3.2.10/modulefiles";
my $builddir   = tempdir(CLEANUP => 1);
# False unless otherwise specified
my $verbose    = 0;
my $clean      = 0;
my $superclean = 0;

sub vprint; # predeclared so it can be used without parens

GetOptions (
  'i|installdir=s' => \$installdir,
  'b|builddir=s'   => \$builddir,
  'm|moduledir=s'  => \$moduledir,
  'v|verbose'      => \$verbose,
  'c|clean'        => \$clean,
  's|superclean'   => \$superclean
  ) or help();

for($installdir, $builddir, $moduledir, qw/tarballs scripts logs/){
  die "Directory '$_' doesn't exist" unless -d $_;
  }

print "Installing applications in:    '$installdir'\n";
print "Using this directory to build: '$builddir'\n";
print "Installing modules to:         '$moduledir'\n";

if(@ARGV){
  print "Installing $ARGV[0]\n";
  newton_install_one();
  }
else
  {
  print "Installing all applications.\n\n";
  newton_install_all();
  }

# Prints a help message
sub help {
  die <DATA>;
}

sub cleanup {
  File::Temp::cleanup();
  die;
  }

# Splits the name by underscores to determine appname and version
sub split_name {
  my $app = shift;
  my ($appname, $appversion) = $app =~ /^([^_]+)_(.+)$/;
  die "FATAL ERROR: Could not find an underscore in '$app'. Rename your tarball.\n" unless defined $appname;
  return($appname, $appversion);
}


# Parses out the "module load" lines to return a list of dependencies
sub get_deps {
  my ($name, $version) = split_name(shift);
  my @deps;
  my $filename = "scripts/$name/$version.sh";
  open (FILE, $filename) or die $!;
  while(<FILE>)
  {
    next unless /^module load (\w+)\/(\S+)/;
    push(@deps, "$1\_$2");
  }
  close FILE;
  return @deps;
}


# Installs the modulefile and .newton file
sub install_module {
  my ($name, $version) = @_;
  # Copy the modulefile and .newton file into the proper directories
  mkdir "$moduledir/$name" or return error('Could not create module directory.');
  return 1 if execute('Error copying module file', "cp scripts/$name/$version $moduledir/$name/");
  return 1 if execute('Error creating .newton flag', "touch $installdir/$name/$version/.newton");
  return 0;
  # If no such modulefile, say so
  # Geri: All scripts should have modules even if they don't do anything.  Probably don't need this then.
}


##############################
#          BUILD             #
##############################
sub build {
  my ($name, $version) = @_;
  # Set application-specific environment variables
  $ENV{INSTALLDIR} = $installdir;
  $ENV{APPNAME} = $name;
  $ENV{VERSION} = $version;
  $ENV{APPDIR}  = "$installdir/$name/$version";

  my $app = "$name\_$version";
  # Remove the previous installation if superclean is set
  if($superclean){
    vprint "--Explicitly deleting '$installdir/$name/$version' before building.\n";
    return 1 if execute('Error removing installation directory', "rm -rf $installdir/$name/$version");
    }

  if(-e "$installdir/$name/$version/.newton" and not $clean){
    vprint "--It's already installed! Not building '$app'.\n";
    return 0;
    }
 
  # Now build the application if it's not already installed
  # Remove previous attempts to build
  return 1 if execute('Error removing build directory', "rm -rf $builddir/$app");

  vprint "--Copying the tarball '$app'.\n";
  return 1 if execute('Error copying source files', "cp -a tarballs/$app $builddir");

  vprint "--Copying the script '$app'.\n";
  return 1 if execute('Error copying script', "cp scripts/$name/$version.sh $builddir/$app/$app.sh");

  vprint "--Running the build script '$app.sh'.\n";
  my $dir = cwd();
  chdir("$builddir/$app");
  my $return_code = execute("The build script failed for $app", "./$app.sh &>$dir/logs/$app.log");
  chdir($dir);

  execute('Error removing build directory.', "rm -rf $builddir/$app");

  return 1 if $return_code;

  return install_module($name, $version);
}

sub vprint {
  print @_ if $verbose;
  }

sub execute {
  my ($errormsg, $cmd) = @_;
  if(system($cmd)){
    return error($errormsg);
    }
  return 0;
  }

sub error {
  my $msg = shift;
  warn $msg;
  open(ERR, '+>> error.log') or die $!;
  print ERR "$msg\n";
  close ERR;
  return 1;
  }

################################
#         INSTALL ALL          #
################################
sub newton_install_all
{
  my $topdir = cwd();
  my ($inarow, @failedapps, %installed) = (1);

  my @apps = glob "tarballs/*";

  # Goes through all the applications
  while(@apps and $inarow < @apps)
  {
    my ($app) = (shift @apps) =~ /^tarballs\/(.+)$/;
    my ($name, $version) = split_name($app);
    next if $? == 1;
    vprint "$name\_$version\n";

    # Check for the existence of the corresponding script
    unless(-e "scripts/$name/$version.sh")
    {
      print "WARNING: Cannot find the build script for '$name/$version'.\n\n";
      next;
    }

    # Get a list of all dependencies that have not been installed during this run
    my @missingdeps = grep {not $installed{$_}} get_deps($app);

    # Push the application to end of build list if it has unmet dependencies
    if(@missingdeps)
    {
      $inarow++;
      push @apps, $app;
      print "\n";
      next;
    }

    # Checks to see if the build succeeded
    if(build($name, $version) != 0){
      print "Building $app failed.\n\n";
      push( @failedapps, $app );
      execute('Error removing flag file', "rm $installdir/$name/$version/.newton");
    }
    else {
      $inarow = 1;
      $installed{$app} = 1;
    }
  }

  # Print out failed applications and unmet dependencies
  print "FAILED APPS:\n";
  print "$_\n" for @failedapps;

  print "UNRESOLVABLE DEPENDENCIES:\n";
  foreach(@apps)
  {
    my $app = $_;
    print "  * $_ depends on: \n";
    my @deps = get_deps($app);
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
  my $app = $ARGV[0];
  my ($name, $version) = split_name($app);

  # Build the application and check for success
  warn "Building $app failed\n\n" if build($name, $version);
}

__DATA__
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

