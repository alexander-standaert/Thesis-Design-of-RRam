/bin/rm -rf SignalStorage
/bin/rm -rf SignalStorageBrowser
/bin/rm SignalStorage.jar

cp -r ~/matlab/java/SignalStorage.jar        SignalStorage.jar

# SignalStorageBroser.jar is now merged in SignalStorage.jar
#/bin/rm SignalStorageBrowser.jar
#cp -r ~/matlab/java/SignalStorageBrowser.jar SignalStorageBrowser.jar

mkdir SignalStorage
mkdir SignalStorageBrowser

cp -r ~/workspace/SignalStorage/src ./SignalStorage/
cp -r ~/workspace/SignalStorageBrowser/src ./SignalStorageBrowser/

#tar cjvf SignalStorageSource.tar.bz2 ~/workspace/fastSpice/src     


