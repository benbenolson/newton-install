#!/usr/bin/perl

use strict; use warnings;
use Cwd; use File::Copy;
use Getopt::Long;
use File::Temp qw/ tempdir /;

# Temporary directories unless otherwise specified
my $installdir;
my $moduledir;
my $builddir;
# False unless otherwise specified
my $verbose    = 0;
my $clean      = 0;
my $superclean = 0;

sub split_name
{
  my $app = shift;
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

# Returns 1 if the given directory is empty
sub is_empty_dir
{
  my $dir = @_;
  my $fh;
  my $file;

  if(opendir($fh, $dir))
  {
    while(defined($file = readdir($fh))
    {
      next if $file eq '.' or $file eq '..';
      closedir($fh);
      return 0;
    }
    closedir($fh);
    return 1;
  }
  else
  {
    return -1;
  }
}

# Builds the application given
sub build
{
  my $app = shift;
  my ($name, $version) = split_name($app);

  # Remove the previous installation if superclean is set
  if($superclean and -e $installdir/$name/$version)
  {
    print "--Explicitly deleting '$installdir/$name/$version' before building.\n" if $verbose;
    `rm -rf $installdir/$name/$version`;
  }

  if($clean or not -e "$installdir/$name/$version")
  {
    `rm -rf $builddir/$name/$version`;

    print "--Copying the tarball '$app'.\n" if $verbose;
    `cp -r tarballs/$app $builddir`;
    if ($? != 0) { `echo "Couldn't find tarball for $app." >> error.log`; return 1; }

    print "--Copying the script '$app'.\n" if $verbose;
    `cp scripts/$name/$version.sh $builddir/$app/$app.sh`;
    if ($? != 0) { `echo "Couldn't find build script for $app" >> error.log`; return 1; }

    print "--Running the build script '$app.sh'.\n" if $verbose;
    my $dir = cwd();
    chdir("$builddir/$app");
    `sh $app.sh &>$dir/logs/$app.log`;
    chdir($dir);
    return $?;
  }
  else
  {
    print "--It's already installed! Not building '$app'.\n" if $verbose;
    return 0;
  }
}

# Parses out the "module load" lines to return a list of dependencies
sub get_deps
{
  my $app = shift;
  my ($name, $ver) = split_name($app);
  my @deps;
  my $filename = "scripts/$name/$ver.sh";
  open (FILE, $filename) or die $!;
  while(<FILE>)
  {
    next unless /^module load (\w+)\/(\S+)/;
    push(@deps, "$1\_$2");
  }
  close FILE;
  @deps;
}

# Copies the modulefile of the specified application over
sub install_module
{
  my $app = shift;
  my ($name, $version) = split_name($app);
  mkdir "$moduledir/$name";
  `cp scripts/$name/$version $moduledir/$name/ &> /dev/null`;
  if($? != 0)
  {
    print "Installed NON-MODULE '$name/$version'\n\n";
  }
  else
  {
    print "Installed MODULE '$name/$version'\n\n";
  }
}

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
    my $app = shift @apps;
    my ($name, $version) = split_name($app);
    if($? == 1) { next; }
    print "Looking at '$name\_$version'.\n" if $verbose;

    # Check for the existence of the corresponding script
    unless(-e "scripts/$name/$version.sh")
    {
      print "WARNING: Cannot find the build script for '$name/$version'.\n";
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
    if(build($app) != 0)
    {
      print "Building $app failed. Deleting installation.\n";
      push( @failedapps, $app );
      `rm -rf $installdir/$name/$version`;
      if(is_empty_dir('$installdir/$name')) { `rmdir $installdir/$name`; }
    }
    else
    {
      $inarow = 1;
      install_module($app);
      $installed{$app} = 1;
    }
  }

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

sub newton_install_one
{
  my $app = $ARGV[0];
  if(build($app) != 0)
  {
    print "Building $app failed\n\n";
  }
  else
  {
    install_module($app);
  }
}

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
  or die "Error in command line arguments.\n";
  
  # Supply a temporary directory if directories are not specified
  if(defined $installdir) { die "Directory \"$installdir\" doesn't exist" unless -d "$installdir"; }
  else { $installdir = tempdir(); }

  if(defined $builddir) { die "Directory \"$builddir\" doesn't exist" unless -d "$builddir"; }
  else { $builddir = tempdir(); }

  if(defined $moduledir) { die "Directory \"$moduledir\" doesn't exist" unless -d "$moduledir"; }
  else { $moduledir = tempdir(); }

  die "Directory \"tarballs\" doesn't exist" unless -d "tarballs";
  die "Directory \"scripts\" doesn't exist" unless -d "scripts";
  die "Directory \"logs\" doesn't exist" unless -d "logs";

  $ENV{INSTALLDIR} = $installdir;
}

setup();
print "Installing applications in:    '$installdir'\n";
print "Using this directory to build: '$builddir'\n";
print "Installing modules to:         '$moduledir'\n";
if(@ARGV) {
  print "Installing $ARGV[0]\n";
  newton_install_one();
} else {
  print "Installing all applications.\n";
  newton_install_all();
}
