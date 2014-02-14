#!/usr/bin/perl
use strict; use warnings;
use Cwd;
use File::Copy;

sub newton_install_all {
  opendir(DIR, getcwd());
  while(defined (my $file = readdir(DIR))) {
    next if (!($file =~ /(^newton_)*.(\.sh$)/));

    #Take the '.sh' off of the script's name
    substr($file, -3) = "";
    
    #Untar the build files
    my $returncode = system("tar xf $file.tar.gz -C buildir");
    if($returncode != 0) {
      print "Failed to untar $file.tar.gz; NOT BUILDING.";
      next;
    }

    #Now copy the script over and run it
    print "Building $file\n";
    copy "$file.sh", "buildir/$file/$file.sh";
    $returncode = system("buildir/$file.sh");
    if($returncode != 0) {
      print "Failed to build $file.\n";
      next;
    }

    print "Finished building $file successfully.\n";
  }
}

newton_install_all();
