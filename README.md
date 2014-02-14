#The Newton Build System

##How to Use
To use this build system, simply run the script "newton_install_all.pl".

This will install all of the applications into the directory specified by the variable INSTALLDIR, so set that environment variable before running the script.

Also, make sure to make your environment the default environment on Newton, or else there could be some module difficulties when the build scripts try to switch modules.

##How it Works
The script simply looks at the current directory, and loops through each of the "newton_*.sh" scripts. Each file that matches this pattern gets copied into the directory "buildir", where the files in the corresponding tar file get copied.  Each of these build scripts checks the environment variable "INSTALLDIR" and installs the application to "$INSTALLDIR/name/version" where name and version are the name and version of the application being built.

The script then checks the return code of each of the build scripts in order to determine if they succeeded or not, and prints out a statment of failure or success depending on that value (0 is success, nonzero is failure).
