#normally, these scripts are already pa
export PATH=../../scripts/scripts/:$PATH

# this is the command you should execute instead of 
# ultrasim -spectre decoder.scs
#
# no special changes are needed in the netlist
# only transient simulations are written as UWI output though
# DC simulations etc. are written in the default format
#
# update the desired UWI settings in the UWIultrasim.sh script
UWIultrasim.sh decoderUltrasim.scs

#sadly enough, part of the request must be put in the netlist...
# - library path is set in the netlist
# - UWI_FORMAT must match the request in the netlist
