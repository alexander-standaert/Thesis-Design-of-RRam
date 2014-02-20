
simulator lang=spectre

parameters PWmin = 100n                         //MinimalTransistorWidth
parameters PLmin = 45n                          //MinimalTransistorLenght
        
parameters numberofruns = 1
parameters enableMismatch = 0  
parameters simlength = 6e-09

parameters wavein_0=[0 0 1e-09 0 1.05e-09 0 2e-09 0 2.05e-09 0 3e-09 0 3.05e-09 0 4e-09 0 4.1e-09 1 5e-09 1 5.05e-09 0 1.05e-08 0]
parameters waveen = [0 0 1e-09 0 1.1e-09 1 2e-09 1 2.05e-09 0 3e-09 0 3.05e-09 0 4e-09 0 4.1e-09 1 5e-09 1 5.05e-09 0 1.05e-08 0]