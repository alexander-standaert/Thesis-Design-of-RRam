#!/bin/bash

echo "this script sets up the signalStorageToolbox in a default configuration"
echo "- matlab scripts are copied to ~/matlab/signalStorage/..."
echo "  there might be conflicts with existing scripts, so be careful"
echo "- java jar file is copied to ~/matlab/java/..."
echo "- UWI executable scripts are placed in ~/bin/signalStorage"
echo "- UWI libraries are placed in ~/bin/signalStorage/libraries/"
echo
echo "documentation and source code are not relocated"
echo
echo " ================== removing ~/matlab/signalStorage"

rm -rf ~/matlab/signalStorage

echo " ================== removing ~/bin/signalStorage"
rm -rf ~/bin/signalStorage

echo " ================== copying to ~/matlab/signalStorage"
mkdir -p ~/matlab/signalStorage
cp -r matlab/* ~/matlab/signalStorage/
rm ~/matlab/signalStorage/updateCodeFromSource.sh
rm ~/matlab/signalStorage/sourceSignalStorage.m

echo " ================== copying to ~/bin/signalStorage"
mkdir -p ~/bin/signalStorage
cp -r scripts/scripts/* ~/bin/signalStorage/
mkdir -p ~/bin/signalStorage/libraries
cp -r libraries/* ~/bin/signalStorage/libraries/

echo " ================== copying SignalStorage.jar to ~/matlab/signalStorage"
mkdir -p ~/matlab/java
cp java/SignalStorage.jar ~/matlab/java/

echo " ================== copying sourceSignalStorage.m to ~/matlab/"
cp matlab/sourceSignalStorage.m ~/matlab/

echo "all done"
echo 
echo "please add ~/bin/signalStorage to your executable path"
echo "if you intend to use the spectre UWI plugins:"
echo "  in ~/.bash_profile, add:"
echo "  export PATH=~/bin/templates:\$PATH"
echo 
echo "bash_profile is only sourced on login shells, e.g. when you log out"
echo "and back in from your desktop environment"
echo 
echo "in matlab, type 'sourceSignalStorage' to add the signalStorage "
echo "methods to the matlab path and to load SignalStorage.jar"

