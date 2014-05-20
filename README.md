#The Newton Build System

##What It Is
The Newton Build System provides a way to automatically recompile and install all of the applications 
installed on a cluster, without the need to manually recompile each and every thing separately. It also 
provides a common format of storing the compilation scripts, modulefiles, and source directories.

Simply put, it runs the build scripts that you give it in the source directory, does some error-checking, and
handles your dependencies for you. However, in order for this to work, the user must write his/her compilation
script in a specified manner. If the user does not, the build may fail or applications may break.

##How to Use

###Modules to Install First
These modules are required for you to install before you run the install script, unless you want things to fail.
Oftentimes, they are directly referenced in the install scripts via a line like 
`module load intel-compilers/2011.5.220`; therefore, if you no longer have the versions of the intel 
compilers that these scripts reference, you will have to change them yourself.

1. intel-compilers/2011.5.220
2. intel-compilers/2013.1
3. cuda/4.2
4. module (no specific version needed)

###Running the build system
After installing the prerequisite applications and making sure that their modules can be loaded, choose the
parameters that you are going to pass the build system.  Here they are:
1. `--installdir`: this is the directory that you want to install your applications to. For example, if I were to
   pass `--installdir=/data/apps` to the build system, gcc version 4.8.1 would be installed to 
   `/data/apps/gcc/4.8.1`. By default, a temporary directory in `$TMPDIR` will be created for you.
2. `--builddir`: this is the directory that the build system will use as temporary space to compile the
   applications. It needs to have plenty of space to compile everything. By default, a temporary directory in
   `$TMPDIR` will be created for you.
3. `--moduledir`: this is the directory where your modulefiles are going to be installed. Typically, this direcotry
   is called `modulefiles` in the environment modules installation directory. Again, a temporary directory will be
   created for you if you do not specify this.
4. `--verbose`: you know what this does.
5. `--clean`: this flag will force the script to overwrite any existing application in the given `installdir`.
6. `--superclean`: this flag will explicitly delete any current installation of the application in `installdir`,
   and then replace it with a clean compile.
After choosing your parameters carefully, run the main script, `install_all.pl`, with those parameters listed. As
long as you do not specify `--clean` or `--superclean`, applications that have been installed in a previous run
will be skipped.

##Adding New Applications
To add applications to the build system, you need to add three files to the build system directory:
  1. Your build script. This is placed in the `scripts` directory.
  2. Your source directory. This is a directory of the source code, where the build script should be 
     copied to and run. Place this directory in the `tarballs` directory.
  3. Your modulefile. Place this in `scripts` as well.
In the following sections, the user is attempting to add `gcc` version `4.8.1` to the build system.

###The Build Script
Write a script called `gcc_4.8.1.sh`.  This script should compile and install the application, 
assuming that `$INSTALLDIR` specifies the location that the applications are going to be installed to.
In my scripts, I use the three lines:

```
APPNAME="gcc"
VERSION="4.8.1"
APPDIR="$INSTALLDIR/$APPNAME/$VERSION"
```

Then, when I go to install the application, I can use a line similar to `./configure --prefix=$APPDIR`
if the application uses a fully compliant GNU build system, and run a `make install` once the 
application is configured and built. Applications will vary, however.

Once you are finished writing this script, name it the version of the application that you are running,
followed by a `.sh`, and place it in `scripts` in the subdirectory with the same name of the application
that you have just built. In our example, our build script would be called `4.8.1.sh` and be placed in
`scripts/gcc/4.8.1.sh`.

###The Installation Directory
Copy the source directory that you used the build script in to build the application. 
The main build system will copy your script directly into this directory, and run the script from there.

WARNING: Occasionally, builds will fail because the source directory did not get cleaned before it was copied 
into the `tarballs` directory. Make sure your installation directory is clean before copying it.

###The Modulefile
Copy the modulefile into `scripts` with the same name of the version of the application you have just built.
In our example, the modulefile would be called `4.8.1`.

This modulefile will be directly copied into your `moduledir`, and will be used to compile future applications,
so be sure that the modulefile is valid and can be loaded properly.
