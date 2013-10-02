function [ types ] = getTransistorTypes65nmTSMC() 
%
% returns a structure with the different transistor types for 90nm UMC
%
%  types.nmos_splvt
%  types.pmos_splvt
%  types.nmos_sp
%  types.pmos_sp
%  types.nmos_sphvt
%  types.pmos_sphvt
%  types.nmos_llhvt
%  types.pmos_llhvt
%
%  each type has the following fields:
%    - name
%    - Advt (V m )  Pelgrom Constant for delta Vt between two transistors
%    - Adbb0 ( % m )  Pelgrom Constant ( use 0.01 instead for 1% )
%    
%  note: normally Advt is expressed in mV um
%  note: normally Adbb0 is expressed in % um


% -- lvt
% lvt  3.2051
% lvt  0.5425 

types.pmos_lvt.name = 'pmos_lvt';
types.pmos_lvt.Advt  = 3.205e-9;   
types.pmos_lvt.Adbb0 =  5.425e-9;   


% lvt 4.2082
% lvt 0.6279
types.nmos_lvt.name  = 'nmos_lvt';
types.nmos_lvt.Advt  = 4.208e-9;   
types.nmos_lvt.Adbb0 =  6.279e-9;   

% -- svt
% svt 3.2646
% svt 0.5912
types.pmos_svt.name  = 'pmos_svt';
types.pmos_svt.Advt  = 3.2646e-9;   
types.pmos_svt.Adbb0 =  5.912e-9;   

% svt 4.4843
% svt 0.6736
types.nmos_svt.name  = 'nmos_svt';
types.nmos_svt.Advt  = 4.4843e-9;   
types.nmos_svt.Adbb0 =  6.736e-9;   


% -- sphvt
% hvt 3.2736
% hvt 0.6152
types.pmos_hvt.name  = 'pmos_hvt';
types.pmos_hvt.Advt  = 3.2736e-9;   
types.pmos_hvt.Adbb0 =  6.152e-9;  

% hvt 5.0907
% hvt 0.7621
types.nmos_hvt.name  = 'nmos_hvt';
types.nmos_hvt.Advt  = 5.0907e-9;   %  5.09  mV um = 5.09e-9  Vm
types.nmos_hvt.Adbb0 = 7.621e-9;    %  0.76  %  um = 7.6e-9    m

end
