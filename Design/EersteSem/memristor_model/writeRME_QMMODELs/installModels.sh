echo "this script copies                                                 "
echo "- all generated table models to ./verilog/RME_QMMODEL_TABLES/      "
echo "- the generated verilog-A module that uses the analytical equations"
echo "  to ./verilog/RME_QMMODEL_ANALYTICAL/RME_QMMODEL.va               "

cp generated/*THz*          ../verilog/RME_QMMODEL_TABLES/
cp generated/RME_QMMODEL.va ../verilog/RME_QMMODEL_ANALYTICAL/
cp generated/HOURGLASS.va   ../verilog/RME_QMMODEL_ANALYTICAL/

