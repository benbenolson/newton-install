#!/usr/bin/perl

use strict; use warnings;
use Cwd; use File::Copy;

# Builds the application given; returns if successful.
sub build {
  print "Building $_[0]\n";
  #`cp -r tarballs/$_[0] buildir`;
  if ($? != 0) { `echo "Couldn't find tarball for $_[0]." >> build.log`; return 1; }
  #`cp scripts/$_[0].sh buildir/$_[0]/$_[0].sh`;
  if ($? != 0) { `echo "Couldn't find build script for $_[0]." >> build.log`; return 1; }
  my $dir = cwd();
  #chdir("buildir/" . $_[0]); `sh $_[0].sh`;
  # Change back to the original top-level directory
  chdir($dir);
  # Return the return code of the build script
  $?;
}

#Parses out the "module load" lines to return a list of dependencies
sub get_deps {
  my @deps;
  my $filename = cwd() . "/scripts/" . $_[0] . ".sh";
  print "Getting dependencies for $filename\n";
  open (FILE, $filename);
  while(my $line = <FILE>) {
    unless($line =~ /^module load/) { next; }
    my @splitline = split(' ', $line);
    my @splitdep = split('/', $splitline[2]);
    push(@deps, "newton_" . $splitdep[0] . "_" . $splitdep[1]);
  }
  print "Dependencies: @deps\n";
  @deps;
}

#Copies the modulefile of the specified application over
sub install_module {
  my @splitapp = split("_", $_[0]); my $name = $splitapp[1]; my $version = $splitapp[2];
  my $currentdir = cwd();
  print "Installing module $name/$version\n";
  `mkdir -p $ENV{INSTALLDIR}/Modules/3.2.10/modulefiles/$name`;
  `cp $currentdir/modulefiles/$name/$version $ENV{INSTALLDIR}/Modules/3.2.10/modulefiles/$name/`;
}

sub newton_install_all {
  my $dirname = cwd() . "/tarballs";
  if( !opendir(DIR, $dirname) ) { print "Tarballs directory not found. Bailing.\n"; die; }
  my @apps = grep { /^newton_/ } readdir DIR;
  my @failedapps;
  my %installed;
  my $app;

  # Goes through all the applications
  while(@apps) {
    $app = shift @apps;
    my @missingdeps = grep {not $installed{$_}} get_deps($app);
    print "Missing dependencies: @missingdeps\n";

    # Push the application to the end of the build list if it has unmet dependencies
    if(@missingdeps) {
      push @apps, $app;
      next;
    }
    #Checks to see if the build succeeded
    if(build($app) != 0) {
      push( @failedapps, $app );
    } else {
      install_module($app);
      $installed{$app} = 1;
    }
  }
}

newton_install_all();
