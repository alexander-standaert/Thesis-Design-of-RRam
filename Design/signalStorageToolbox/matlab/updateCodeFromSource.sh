/bin/rm -rf halfPrecision
/bin/rm -rf javaSignals
/bin/rm -rf outdatedSignals
/bin/rm -rf helpers
/bin/rm -rf javaToMatlab
/bin/rm -rf signalStorage
/bin/rm -rf waveBrowser
/bin/rm sourceSignalStorage.m


cp -r ~/matlab/signalStorage/* .
cp ~/matlab/sourceSignalStorage.m .


/bin/rm halfPrecision/*.m~
/bin/rm javaSignals/*.m~
/bin/rm outdatedSignals/*.m~
/bin/rm helpers/*.m~
/bin/rm javaToMatlab/*.m~
/bin/rm signalStorage/*.m~
/bin/rm waveBrowser/*.m~

