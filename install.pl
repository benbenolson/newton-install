#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
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
my $test       = 0;

sub vprint; # predeclared so it can be used without parens

GetOptions (
  'i|installdir=s' => \$installdir,
  'b|builddir=s'   => \$builddir,
  'm|moduledir=s'  => \$moduledir,
  'v|verbose'      => \$verbose,
  'c|clean'        => \$clean,
  's|superclean'   => \$superclean,
  't|test'         => \$test
  ) or help();

for($installdir, $builddir, $moduledir, qw/tarballs scripts logs/)
{
  die "Directory '$_' doesn't exist" unless -d $_;
}

print "Doing a harmless test run; no files will be changed.\n" if $test;
print "Installing applications in:    '$installdir'\n";
print "Using this directory to build: '$builddir'\n";
print "Installing modules to:         '$moduledir'\n";


###############################
#     HELPER FUNCTIONS        #
###############################
# Prints a help message
sub help
{
  die <DATA>;
}

sub cleanup
{
  File::Temp::cleanup();
  die;
}

sub vprint
{
  print @_ if $verbose;
}

sub execute 
{
  return 0 if $test;
  my ($errormsg, $cmd) = @_;
  if(system("$cmd"))
  {
    return error($errormsg);
  }
  return 0;
}

sub error
{
  my $msg = shift;
  warn $msg;
  open(ERR, '+>> error.log') or die $!;
  print ERR "$msg\n";
  close ERR;
  return 1;
}

# Splits the name by underscores to determine appname and version
sub split_name
{
  my $app = shift;
  my ($name, $version) = $app =~ /^(.+)\/(.+)/;
  return($name, $version);
}


# Parses out the "module load" lines to return a list of dependencies
sub get_deps
{
  my ($name, $version) = split_name(shift);
  my @deps;
  my $filename = "scripts/$name/$version.sh";
  open (FILE, $filename) or die $!;
  while(<FILE>)
  {
    next unless /^module load (\w+)\/(\S+)/;
    push(@deps, "$1\/$2");
  }
  close FILE;
  return @deps;
}

sub get_deps_recursive
{
  my ($name, $version) = split_name(shift);
  my @deps;
  my $total_deps = shift;
  my $filename = "scripts/$name/$version.sh";

  open (FILE, $filename) or die $!;
  while(<FILE>)
  {
    next unless /^module load (\w+)\/(\S+)/;
    print "Found dependency $1\/$2\n";
    push(@deps, "$1\/$2");
  }
  close FILE;

  print "name is now $name\n";
  print "Deps is now: @deps\n";
  print "Total_deps is now: $total_deps\n";
  
  foreach(@deps)
  {
    print "Pushing $_ to total_deps\n";
    push(@$total_deps, $_);
    get_deps_recursive($_, $total_deps)
  }
  return @deps;
}


# Installs the modulefile and .newton file
sub install_module
{
  my ($name, $version) = @_;
  # Copy the modulefile and .newton file into the proper directories
  if(not -d "$moduledir/$name")
  {
    execute('Could not create module directory.', "mkdir $moduledir/$name");
  }
  return 1 if execute("$name $version: Error copying module file", "cp scripts/$name/$version $moduledir/$name/");
  return 1 if execute("$name $version: Error creating .newton flag", "touch $installdir/$name/$version/.newton");
  return 0;
}


##############################
#          BUILD             #
##############################
sub build
{
  my ($name, $version) = @_;
  my $app = "$name/$version";
  # Set application-specific environment variables
  $ENV{INSTALLDIR} = "$installdir";
  $ENV{APPNAME}    = "$name";
  $ENV{VERSION}    = "$version";
  $ENV{APPDIR}     = "$installdir/$name/$version";

  # Remove the previous installation if superclean is set
  if($superclean)
  {
    vprint "--Explicitly deleting '$installdir/$name/$version' before building.\n";
    return 1 if execute("$name $version: Error removing installation directory", "rm -rf $installdir/$name/$version");
  }

  if(-e "$installdir/$name/$version/.newton" and not $clean)
  {
    vprint "--It's already installed! Not building '$app'.\n\n";
    return 0;
  }
 
  # Now build the application if it's not already installed
  # Remove previous attempts to build
  return 1 if execute("$name $version: Error removing build directory", "rm -rf $builddir/$name");
  return 1 if execute("$name $version: Error creating build directory", "mkdir -p $builddir/$name");
  return 1 if execute("$name $version: Error creating log directory", "mkdir -p logs/$name");

  # Untar the source tarball
  vprint "--Untarring '$version.tar.gz' to '$builddir/$name'.\n";
  return 1 if execute("$name $version: Error copying source files", "tar -xzf scripts/$name/$version.tar.gz -C $builddir/$name");
  opendir(DIR, "$builddir/$name") or die $!;
  my $sourcedir;
  while($sourcedir = readdir(DIR))
  {
    next if $sourcedir =~ /^\.{1,2}$/;
    next unless (-d "$builddir/$name/$sourcedir");
    last;
  }
  return error("The tarball did not contain a source directory.") if not defined $sourcedir;

  vprint "--Copying the script '$version.sh' to '$builddir/$name/$sourcedir'.\n";
  return 1 if execute("$name $version: Error copying script", "cp scripts/$name/$version.sh $builddir/$name/$sourcedir");

  vprint "--Running the build script '$app.sh'.\n";
  my $dir = cwd();
  chdir("$builddir/$name/$sourcedir");
  my $return_code = execute("$name $version: The build script failed", "./$version.sh &> $dir/logs/$name/$version.log");
  chdir($dir);

  execute("$name $version: Error removing build directory.", "rm -rf $builddir/$name");

  vprint "\n";

  return 1 if $return_code;
  return install_module($name, $version);
}


################################
#         INSTALL ALL          #
################################
sub newton_install_all
{
  my $topdir = cwd();
  my $inarow = 0;
  my (@failedapps, %installed);
  my @apps;

  if(@ARGV)
  {
    my $app = $ARGV[0];
    my $recurse = 1;
    my @total_deps;

    print "Installing $app\n";
    push(@apps, "$app");
    get_deps_recursive($app, \@total_deps);
    print "DEPENDENCIES: @total_deps\n";
    foreach(@total_deps)
    {
      push(@apps, $_);
    }
  }
  else
  {
    print "Installing all applications.\n\n";
    for (glob "scripts/*")
    {
      my @versions = glob "$_/*.sh";
      for (@versions)
      {
        /scripts\/(.+)\/(.+)\.sh/;
        my ($name, $version) = ($1, $2);
        s/\.sh$/\.tar\.gz/g;
        push(@apps, "$name/$version") if -e $_;
      }
    }
  }

  # Goes through all the applications
  while(@apps and $inarow < @apps)
  {
    my $app = shift @apps;
    my ($name, $version) = split_name($app);
    next if $? == 1;
    vprint "$name/$version\n";

    # Get a list of all dependencies that have not been installed during this run
    my @missingdeps = grep {not $installed{$_}} get_deps($app);

    # Push the application to end of build list if it has unmet dependencies
    if(@missingdeps)
    {
      $inarow++;
      push @apps, $app;
      vprint "\n";
      next;
    }

    # Checks to see if the build succeeded
    if(build($name, $version) != 0)
    {
      print "Building $app failed.\n\n";
      push( @failedapps, $app );
    }
    else
    {
      $inarow = 0;
      $installed{$app} = 1;
    }
  }

  # Print out failed applications and unmet dependencies
  if(@failedapps)
  {
    print "FAILED APPS:\n";
    print "$_\n" for @failedapps;
  }

  if(@apps)
  {
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
}

newton_install_all();


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

