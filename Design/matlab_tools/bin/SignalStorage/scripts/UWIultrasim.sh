#!/bin/bash

# UWIultrasim.sh
# =======================
# run ultrasim with UWI compressed output
#
# make sure you update the following variables once to suit your system setup
# - UWI_LIB_PATH
# ---- the directory with the *.so files
# - UWI_HARDDRIVE
# ---- should point to your local hard drive
#      e.g. /esat/prometheus1/users/scoseman/
# ---- used in combination with UWI_TO_HARDRIVE
# 
# set your preferences for the variables
# - UWI_HEADER
# - UWI_FORMAT
# - UWI_TO_HARDDRIVE
# --- if set to 'yes', results are saved to
#     UWI_HARDDRIVE/ pwd /UWI_OUTPUT_PATH
# 
# disable the echo's at the bottom once you know the story
#
# you can overrule the following variables by setting them before 
# calling this script
# - UWI_OUTPUT_PATH 
# - UWI_FORMAT
# - UWI_HEADER
# - UWI_TO_HARDRIVE

export UWI_LIB_PATH=~/projects/spectreBinaryWaves/signalStorageToolbox/libraries
# should not include /

export UWI_HARDDRIVE=/esat/prometheus1/users/scoseman/simulations
# should not include /

# --- determine platform  {{{1
# ( thanks to Anselme Vignon )
case $HOSTTYPE in
x86_64) export UWI_PLATFORM=64 ; export CDS_AUTO_64BIT=ALL ;;
*)      export UWI_PLATFORM=32  ;;
esac # 32 or 64
#echo $UWI_PLATFORM  # 32 or 64
# ----------------------  }}}1

# --- UWI_TO_HARDDRIVE  {{{1
if test "${UWI_TO_HARDDRIVE+set}" != set ; then
  #UWI_TO_HARDRIVE="yes"
  UWI_TO_HARDRIVE="no"  
#else
  #UWI_TO_HARDRIVE is set
fi 
# ----------------------  }}}1

# --- header type  {{{1
if test "${UWI_HEADER+set}" != set ; then
  #export UWI_HEADER=H  # print header (plot name and wave definitions)
  #export UWI_HEADER=NH # do not print header
  export UWI_HEADER=CH # print compressed header
#else
  #UWI_HEADER is set
fi
# ----------------------  }}}1

# ---- output folder/prefix {{{1
# can be an absolute or relative path, can end on a filename prefix
if test "${UWI_OUTPUT_MAP+set}" != set ; then
  export UWI_OUTPUT_MAP=UWI/
  #export UWI_OUTPUT_MAP=UWI/prefix
#else
  #UWI_OUTPUT_MAP is set
fi

if [[ $UWI_TO_HARDRIVE == yes ]] ; then
  # get the current path, but drop e.g. /users/micas/scoseman/
  currentPath=`pwd`
  endPath=${currentPath#/*/*/*/} 
  UWI_OUTPUT_MAP="${UWI_HARDDRIVE}/${endPath}/${UWI_OUTPUT_MAP}"
#else 
  # keep current output path
fi
mkdir -p $UWI_OUTPUT_MAP
# known annoyance: if UWI_OUTPUT_MAP ends on a prefix (not on a /)
# an empty directory with name prefix is created
# ----------------------  }}}1

# ---- output format {{{1
if test "${UWI_FORMAT+set}" != set ; then
  ##export UWI_FORMAT=NCA  #ascii
  #export UWI_FORMAT=COA  #ascii
  #export UWI_FORMAT=COH  #half precision
  export UWI_FORMAT=COF  #float ( single precision )
  #export UWI_FORMAT=COD  #double precision
fi
# ----------------------  }}}1

# ---- precision settings {{{1
# ---- ultrasim does a great job itself at prefiltering the points, 
#      so just don't ruin it
export UWI_ISTEP=0
export UWI_VSTEP=0
export UWI_TSTEP=1000e-12
# ----------------------  }}}1


## notice
# sadly enough, must put part of the request in netlist...
# you can comment these lines if you want to 
echo "UWI notice"
echo "to enable UWI output, add the following lines to in the netlist:"
echo ""
echo ".usim_opt uwi_lib = $UWI_LIB_PATH/compressed_UWI$UWI_PLATFORM.so" 
echo ".usim_opt wf_format=$UWI_FORMAT"

ultrasim -spectre $@

