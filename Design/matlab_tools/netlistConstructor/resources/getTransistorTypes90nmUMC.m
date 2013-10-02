function [ types ] = getTransistorTypes90nmUMC() 
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


% -- splvt
types.pmos_splvt.name = 'pmos_splvt';
types.pmos_splvt.Advt  = 3.7e-9;   
types.pmos_splvt.Adbb0 =  11e-9;   

types.nmos_splvt.name  = 'nmos_splvt';
types.nmos_splvt.Advt  = 4.1e-9;   
types.nmos_splvt.Adbb0 =  12e-9;   


% -- sp
types.pmos_sp.name  = 'pmos_sp';
types.pmos_sp.Advt  = 3.7e-9;   
types.pmos_sp.Adbb0 =  11e-9;   

types.nmos_sp.name  = 'nmos_sp';
types.nmos_sp.Advt  = 4.1e-9;   
types.nmos_sp.Adbb0 =  12e-9;   


% -- sphvt
types.pmos_sphvt.name  = 'pmos_sphvt';
types.pmos_sphvt.Advt  = 3.5e-9;   
types.pmos_sphvt.Adbb0 =  10e-9;  

types.nmos_sphvt.name  = 'nmos_sphvt';
types.nmos_sphvt.Advt  = 4.9e-9;   %  4.9  mV um = 4.9e-9  Vm
types.nmos_sphvt.Adbb0 = 17e-9;    %  1.6  %  um = 16e-9    m


% -- llhvt
types.pmos_llhvt.name = 'pmos_llhvt';
types.pmos_llhvt.Advt  =  4e-9;   
types.pmos_llhvt.Adbb0 =  12e-9;   

types.nmos_llhvt.name = 'nmos_llhvt';
types.nmos_llhvt.Advt  = 6.8e-9;   
types.nmos_llhvt.Adbb0 =  22e-9;   



end
