* hspice / eldo example

* --------------------------------
* needed for eldo :
.PROBE DC
.PROBE TRAN
* -------------------------------

.OPTION CSDF


.TRAN 0.1p  1000n 
.DC Vin 0 1 0.1

Vin n1 0 pulse 0 1 1n 0.1n 0.2n 0.4n 1n 
*Vin  n1 0 PWL( 0p 0 10p 1 )

R_1   n2 n1   10k
C_1   n2 0    1f

R_2   n3 n2   10k
C_2   n3 0    1f

R_3   n4 n3   10k
C_3   n4 0    1f

R_4   n5 n4   10k
C_4   n5 0    1f

R_5   px n5   10k
C_5   px 0    1f

.end
