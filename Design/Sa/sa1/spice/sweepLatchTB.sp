simulator lang=spice

.include './LightLatch.sp'
.lib '../../../technology_models/tech_wrapper.lib' mc

simulator lang=spectre

mlatch (out outbar vdd gnd vdd gnd LE1 LE2) latch
minv1 (out vx vdd gnd) invertor
minv2 (outbar vxb vdd gnd) invertor


parameters VDC = 1

statistics{
     mismatch{
        vary VDC dist=gauss std=50 percent=yes
    }
}

vvdd vdd 0 vsource type=dc dc=VDC
vvss gnd 0 vsource type=dc dc=0

vLE1 LE1 gnd vsource type=dc dc=0
vLE2 LE2 gnd vsource type=dc dc=1

mismatchanalysis montecarlo variations=all numruns=100 {
ana tran step=1e-12 stop=3e-09
}