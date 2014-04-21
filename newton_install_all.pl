#!/usr/bin/perl

use strict; use warnings;
use Cwd; use File::Copy;

# Builds the application given; returns if successful.
sub build {
  my $app = shift;
  print "Copying the tarball $app\n";
  `cp -r tarballs/$app buildir`;
  if ($? != 0) { `echo "Couldn't find tarball for $app." >> error.log`; return 1; }
  `mkdir -p buildir/$app`;
  print "Copying the script $app\n";
  `cp scripts/$app.sh buildir/$app/$app.sh`;
  if ($? != 0) { `echo "Couldn't find build script for $app" >> error.log`; return 1; }
  my $dir = cwd();
  chdir("buildir/$app");
  print "Running build script for $app\n";
  `sh $app.sh &>../../logs/$app.log`;
  # Change back to the original top-level directory
  chdir($dir);
  # Return the return code of the build script
  $?;
}

#Parses out the "module load" lines to return a list of dependencies
sub get_deps {
  my $name = shift;  
  my @deps;
  my $filename = "scripts/$name.sh";
  open (FILE, $filename) or die $!;
  while(<FILE>) {
    next unless /^module load (\w+)\/(\S+)/;
    push(@deps, "newton_$1\_$2");
  }
  close FILE;
  @deps;
}

#Copies the modulefile of the specified application over
sub install_module {
  my @splitapp = split("_", $_[0]); my $name = $splitapp[1]; my $version = $splitapp[2];
  mkdir "$ENV{MODULEDIR}/$name";
  `cp modulefiles/$name/$version $ENV{MODULEDIR}/$name/ &> /dev/null`;
  if($? != 0) {
    print "Installed NON-MODULE $name/$version\n";
  }
  else {
    print "Installed MODULE $name/$version\n";
  }
}

sub setup
{
  die "Environment variable INSTALLDIR not set. Bailing.\n"
    unless $ENV{INSTALLDIR} and -d $ENV{INSTALLDIR};
  die "Environment variable MODULEDIR not set. Bailing.\n"
    unless $ENV{MODULEDIR} and -d $ENV{MODULEDIR};

  #Check directories and environment
  die "tar dir doesn't exist" unless -d "tarballs";
}

sub newton_install_all {

  #Variable declarations
  my $topdir = cwd();
  my ($inarow, @failedapps, %installed) = (1);

  chdir("tarballs");
  my @apps = glob "newton_*";
  chdir($topdir);

  # Goes through all the applications
  while(@apps and $inarow < @apps) {
    my $app = shift @apps;
    my @missingdeps = grep {not $installed{$_}} get_deps($app);

    # Push the application to end of build list if it has unmet dependencies
    if(@missingdeps) {
      $inarow++;
      push @apps, $app;
      next;
    }

    #Checks to see if the build succeeded
    if(build($app) != 0) {
      print "Building $app failed\n";
      push( @failedapps, $app );
    } else {
      $inarow = 1;
      install_module($app);
      $installed{$app} = 1;
    }
  }
  print "FAILED APPS:\n";
  print "$_\n" for @failedapps;

  print "UNRESOLVABLE DEPENDENCIES:\n";
  foreach(@apps) {
    print "  * $_ depends on: \n";
    my @deps = get_deps $_;
    foreach(@deps) {
      print "      $_ ";
      print "$installed{$_} " if $installed{$_};
      print "\n";
    }
    print "\n";
  }
}

sub newton_install_one
{
  my $app = $ARGV[0];
  if(build($app) != 0) {
    print "Building $app failed\n";
  } else {
    install_module($app);
  }
}

if(@ARGV == 0) {
  setup();
  newton_install_all();
} else {
  setup();
  newton_install_one();
}
