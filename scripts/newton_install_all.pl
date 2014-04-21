#!/usr/bin/perl

use strict; use warnings;

# Builds the application given; returns if successful.
sub build {
  
}

sub newton_install_all {
  my @scripts = glob("newton_*.sh");
  my $returncode = 0;
  foreach(@scripts) {
    build($_);
  }
}

newton_install_all();
