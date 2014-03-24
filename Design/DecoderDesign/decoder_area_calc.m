function [] = decoder_area_calc()
p_lmin = 45e-9;
n_lmin = 45e-9;
p_wmin = 100e-9;
n_wmin = 100e-9;

a_inv = p_lmin*2*p_wmin + n_lmin*n_wmin;
a_2nand = 8*p_lmin*4*p_wmin;
a_2nor = 10*4*p_lmin*2*p_wmin;
a_3nand = 15*6*p_lmin*2*p_wmin;
a_3nor = 21*4*p_lmin*2*p_wmin;

a_2to4 = fa_2to4(1,1);
a_3to8 = fa_3to8(1,1,1);

a1_decoder4 = fa1_4(1,1,1,1);
a1_decoder5 = fa1_5(1,1,1,1);
a1_decoder6 = fa1_6(1,1,1,1,1);
a1_decoder7 = fa1_7(1,1,1,1,1,1);
a1_decoder8 = fa1_8(1,1,1,1,1,1,1);
a1_decoder9 = fa1_9(1,1,1,1,1,1,1);

a1 = [a1_decoder4,a1_decoder5,a1_decoder6,a1_decoder7,a1_decoder8,a1_decoder9]
a2 = [fa2_4(),fa2_5(),fa2_6(),fa2_7(),fa2_8(),fa2_9()]
close all
figure
hold on
plot([4:9],a1/(45e-9*45e-9),'r')
plot([4:9],a2/(45e-9*45e-9))

xlim([3.5,9.5])
ylabel('Area (F^2)','FontSize', 12,'FontWeight','bold')
xlabel('Number of inputs of decoder','interpreter','none','FontSize', 12,'FontWeight','bold')

function [a] = fa_2to4(m1,m2)
  a = m2*2*1.2*a_inv + m2*a_inv + 4*a_2nand + m1*4*a_2nor;  
end

function [a] = fa_3to8(m1,m2,m3)
  a = m3*3*1.2*a_inv + m2*a_inv + m2*8*a_2nand + m1*8*a_2nor; 
end

function [a] = fa1_4(m1,m2,m3,m4)
  a = m4*a_inv + fa_2to4(m4,2*m3) + 4*fa_2to4(m2,m1) + m2*a_inv*4*4; 
end

function [a] = fa1_5(m1,m2,m3,m4)
  a = m4*a_inv + fa_2to4(m4,2*m3) + 4*fa_3to8(m3,m2,m1) + m2*a_inv*4*4; 
end

function [a] = fa1_6(m1,m2,m3,m4,m5)
  a = m4*a_inv +fa_3to8(m5,2*m4,4*m3) + 8*fa_3to8(m3,m2,m1) + m2*a_inv*8*8; 
end

function [a] = fa1_7(m1,m2,m3,m4,m5,m6)
  a = fa1_4(m3*8,4*m4,2*m5,m6) + 16*fa_3to8(m3,m2,m1) + m2*a_inv*16*16; 
end

function [a] = fa1_8(m1,m2,m3,m4,m5,m6,m7)
  a = fa1_4(m4*8,4*m5,2*m6,m7) + 16*fa1_4(m1,m2,m3,16*m4); 
end

function [a] = fa1_9(m1,m2,m3,m4,m5,m6,m7)
  a = fa1_4(m4*8,4*m5,2*m6,m7) + 16*fa1_5(m1,m2,m3,16*m4); 
end

function [a] = fa2_4()
  a = 2*a_inv + 2*fa_2to4(1,1) + 16*a_2nor + 16*a_inv*1.2; 
end

function [a] = fa2_5()
  a = 2*a_inv + fa_2to4(1,1) + fa_3to8(1,1,1) + 32*a_2nor + 8*a_inv*1.2 + 4*a_inv*2; 
end

function [a] = fa2_6()
  a = 2*a_inv + 2*fa_3to8(1,1,1) + 64*a_2nor + 16*a_inv*1.5; 
end

function [a] = fa2_7()
  a = 2*a_inv + 2*fa_2to4(1,1) + fa_3to8(1,1,1) + 128*a_2nor + 16*a_inv*2 + 16*a_inv*4 + 16*a_inv*16; 
end

function [a] = fa2_8()
  a = 2*a_inv + fa_2to4(1,1) + 2*fa_3to8(1,1,1) + 265*a_2nor + 20*a_inv*2 + 20*a_inv*4 + 20*a_inv*16; 
end

function [a] = fa2_9()
  a = 2*a_inv + 3*fa_3to8(1,1,1) + 512*a_2nor + 24*a_inv*2 + 24*a_inv*4 + 24*a_inv*16; 
end



end
