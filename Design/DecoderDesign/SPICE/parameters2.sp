
simulator lang=spectre

parameters PWmin = 100n                         //MinimalTransistorWidth
parameters PLmin = 45n                          //MinimalTransistorLenght
        
parameters numberofruns = 1
parameters enableMismatch = 0  
parameters simlength = 3e-09

parameters wavein_0=[0 0 1e-09 0 1.05e-09 0 2e-09 0 2.05e-09 0 7.5e-09 0]
parameters wavein_1=[0 0 1e-09 0 1.05e-09 0 2e-09 0 2.05e-09 0 7.5e-09 0]
parameters wavein_2=[0 0 1e-09 0 1.1e-09 1 2e-09 1 2.05e-09 0 7.5e-09 0]
parameters wavein_3=[0 0 1e-09 0 1.05e-09 0 2e-09 0 2.05e-09 0 7.5e-09 0]
parameters wavein_4=[0 0 1e-09 0 1.05e-09 0 2e-09 0 2.05e-09 0 7.5e-09 0]
parameters waveen = [0 0 1e-09 0 1.1e-09 1 2e-09 1 2.05e-09 0 7.5e-09 0]

parameters dec1multstage_1 = 0.6
parameters dec1multstage_2 = 1
parameters dec1multstage_3 = 1
parameters dec1multstage_4 = 1