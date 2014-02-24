#The Newton Build System

##How to Use
1. First, set your environment to the default Newton environment: this means that your Intel compilers module should be loaded.

2. Next, set the environment variable `INSTALLDIR` to the top-level directory where you want your applications installed.

3. Some modules have to explicitly link to the MKL, and they use the `INSTALLDIR` environment variable to do this.  Make sure you have your intel compilers installed in $INSTALLDIR/intel/2011.5.220 or whichever version you use.

4. Now, run the script `newton_install_all.pl` and wait for the applications to be installed.

##How it Works
The script simply looks at the current directory, and loops through each of the `newton_*.sh` scripts. 
Each file that matches this pattern gets copied into the directory `buildir`, where the files in the corresponding tar file 
get copied.  Each of these build scripts checks the environment variable `INSTALLDIR` and installs the application to 
`$INSTALLDIR/name/version` where name and version are the name and version of the application being built.

Then, after building an application, it will copy the appropriate modulefile from the `modulefiles` directory, assuming that you have
your Modules system installed in `$INSTALLDIR/Modules/3.2.10`.

The script then checks the return code of each of the build scripts in order to determine if they succeeded or not, and 
prints out a statment of failure or success depending on that value (0 is success, nonzero is failure).  It outputs the successes and
failures to a file called `build.log`, which will be in the same directory as `newton_install_all.pl`.
