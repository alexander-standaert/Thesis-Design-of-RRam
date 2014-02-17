
simulator lang=spectre

parameters PWmin = 100n                         //MinimalTransistorWidth
parameters PLmin = 45n                          //MinimalTransistorLenght
parameters WChargeBL = 5e-07         //BitLineChargerWidth(perBL)
parameters WDischargeBL = 5e-07   //BitLineDischargerWidth(perBL)
parameters WDischargeSL = 5e-07   //SourceLineDischargerWidth(perBL)
parameters Cpar = 0.18e-15                      //ParasiticCapacitor(perCell)
parameters PWn = 1e-07                     //DifferentialNpairWidth(perSA)
parameters PWp = 1e-07                     //DifferentialPpairWidth(perSA)
parameters PWpenable = 1e-07         //SenseAmpEnablePWidth(perSA)
parameters PWnenable = 1e-07         //SenseAmpEnableNWidth(perSA)
parameters PWmuxLB = 2e-07                //PassgateWidth(perMuxLB)
parameters PWmuxLB = 2e-07                //PassgateWidth(perMuxGB)

parameters numberofruns = 1
parameters enableMismatch = 0   //Mismatch
parameters simlength = 3e-09


parameters RMEM = 10000;