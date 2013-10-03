export UWI_FORMAT=${UWI_FORMAT_NC}
spectre -format uwi -uwifmt ${UWI_FORMAT} -uwilib ${UWI_LIB_PATH}/noncompressed_UWI${UWI_PLATFORM}.so $@ 
