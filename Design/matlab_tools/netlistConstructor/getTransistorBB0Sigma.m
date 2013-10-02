function [ sigmaBB0 ] = getTransistorBB0Sigma( transistor )
%function [ sigmaBB0 ] = getTransistorBB0Sigma( transistor )
%
% e.g.
% transistor
%           name: 'Mtop'
%          nodes: {'vdd'  'SAactBar'  'top'  'vddBulk'}
%           type: [1x1 struct]
%     paramNames: {'w'  'l'  'shiftVt'  'shiftBeta'}
%    paramValues: [8.000000000000000e-07 8.000000000000000e-08 0 0]
%
% transistor.type:
%     name: 'pmos_sphvt'
%     Advt: 3.500000000000000e-09
%    Adbb0: 1.000000000000000e-08
%
% call returns Adbb0/sqrt(2)/sqrt(W*L)
  w = transistor.paramValues(1);
  l = transistor.paramValues(2);

  sigmaBB0 = transistor.type.Adbb0 / (sqrt(2*w*l));
end
