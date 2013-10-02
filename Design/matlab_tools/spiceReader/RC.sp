This is my rather long title  ============================================================================================xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ppppppppppppppppppppc

.PRINT TRAN
.OPTIONS POST=ASCII

.TRAN 1p  1n 

Vin  n1 0 PWL( 0p 0 10p 1 )

R_1   n2 n1   10k
C_1   n2 0    1f

R_2   n3 n2   10k
C_2   n3 0    1f

R_3   n4 n3   10k
C_3   n4 0    1f

R_4   n5 n4abcdefghijklmnopqrstuvewxyzabcdefghijklmnopqrstuvewxyabcdefghijklmnop   10k
C_4   n5 0    1f

R_5   p  n5   10k
C_5   p  0    1f

.end
