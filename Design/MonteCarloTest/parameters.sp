simulator lang=spectre

parameters PWp = 1*100n
parameters PWn = 1*100n

parameters Rload1 = 100
parameters Rmemcell = 5000
parameters Cload1 = 1.8e-14
parameters Rload2 = 100
parameters Rmemhigh = 35000
parameters Cload2 = 1.8e-14
parameters Rload3 = 100
parameters Rmemlow = 10000
parameters Cload3 = 1.8e-14 

parameters bl_1initial = 0.1
parameters bl_refinitial = 0.1


parameters sel1_1wave=[0 1 2.5e-09 1 2.55e-09 0 8.5e-09 0]
parameters sel1_2wave=[0 1 2.5e-09 1 2.55e-09 0 8.5e-09 0]
parameters sel1_3wave=[0 1 2.5e-09 1 2.55e-09 0 8.5e-09 0]
parameters sel2_1wave=[0 0 5e-10 0 6e-10 1 1.5e-09 1 1.55e-09 0 7.5e-09 0]
parameters sel2_2wave=[0 0 5e-10 0 6e-10 1 1.5e-09 1 1.55e-09 0 7.5e-09 0]
parameters sel2_3wave=[0 0 5e-10 0 6e-10 1 1.5e-09 1 1.55e-09 0 7.5e-09 0]
parameters wl_1wave=[0 0 2.5e-09 0 2.6e-09 1 8e-09 1]
parameters wl_2wave=[0 0 2.5e-09 0 2.6e-09 1 8e-09 1]
parameters wl_3wave=[0 0 2.5e-09 0 2.6e-09 1 8e-09 1]
parameters switch1wave=[0 0 5e-09 0 5.1e-09 1 7e-09 1 7.05e-09 0 1.2e-08 0]
parameters switch2wave=[0 0 5e-09 0 5.1e-09 1 7e-09 1 7.05e-09 0 1.2e-08 0]
parameters lepwave=[0 1 8e-09 1 8.05e-09 0 1.3e-08 0]
parameters lenwave=[0 0 8e-09 0 8.1e-09 1 1.3e-08 1]

parameters numberofruns = 100