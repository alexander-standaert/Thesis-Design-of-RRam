#export PLATFORM=64    # 32 or 64
# set by compile32.sh or comile64.sh

echo "compiling for $PLATFORM bit system"

#export UWI_INCLUDE=/esat/micas_raid/software/cadence_mmsim_6.2/tools.lnx86/ultrasim/include
export UWI_INCLUDE=/esat/micas_raid/software/cadence_mmsim_7.01/tools.lnx86/ultrasim/include

echo "===== compiling for ${PLATFORM} bit"

echo '===== compressed (CO*)'
g++ compressed_UWI.c -ansi -pedantic -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -fPIC -c -m${PLATFORM}  -I${UWI_INCLUDE}

g++ -shared -g -o compressed_UWI${PLATFORM}.so compressed_UWI.o
#gcc -shared -o compressed_UWI${PLATFORM}.so compressed_UWI.o

echo
echo '===== noncompressed (NC*)'
g++ noncompressed_UWI.c -ansi -pedantic -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings -g -fPIC -c -m${PLATFORM}  -I${UWI_INCLUDE}

g++ -shared -g -o noncompressed_UWI${PLATFORM}.so noncompressed_UWI.o
#gcc -shared -g -o noncompressed_UWI${PLATFORM}.so noncompressed_UWI.o

echo '===== cleaning'
rm *.o

echo '===== moving libraries to ../libraries'
mv *.so ../libraries/

echo '===== done'
