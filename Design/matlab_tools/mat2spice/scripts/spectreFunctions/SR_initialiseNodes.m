function [ output ] = SR_initialiseNodes( SR, instanceName )
% output = SR_initialiseNodes( SR, instanceName )
% 
% example:
% bus(  SR, 'XinputSR' )
% with 
%   SR.segment_names   = { 'A', 'B' }
%   SR.segment_lengths = [ 2  . 1   ]
%   SR.rows =2;
%   SR.inits = [   1 0 1  ;  0  0  0 ]
%
% results in a list of ic-statements, one for each M and one for 
% each slave of the SR.  Only works when asyncreset is low

output='';

%SR

for r = 1:SR.rows
    c = 1;
    for s = 1:length( SR.segment_lengths )
        for i=1:SR.segment_lengths(s) 
            val    = SR.inits( r, c );
            valBar = 1-val;
        
            output = sprintf( '%sic   %s.Xrow_%d.X_segment_%d.Xff_%d.Qm=%g\n', output, ...
                              instanceName, r-1, s-1, i-1, val );
            output = sprintf( '%sic   %s.Xrow_%d.X_segment_%d.Xff_%d.QmBar=%g\n', output, ...
                              instanceName, r-1, s-1, i-1, valBar );
            output = sprintf( '%sic   %s.Xrow_%d.X_segment_%d.Xff_%d.out=%g\n', output, ...
                              instanceName, r-1, s-1, i-1, val );
            output = sprintf( '%sic   %s.Xrow_%d.X_segment_%d.Xff_%d.outBar=%g\n\n', output, ...
                              instanceName, r-1, s-1, i-1, valBar );
             
            c=c+1;
        end
    end
end

end
