function [ f ] =HPFtofloat( hpf )
% hpf must be uint16  (or array of uint16)
% f will be 4-byte float
%
% hpf allows values from +- 5.96046 × 10−8 to +- 65504
% incomplete implementation
% see http://en.wikipedia.org/wiki/Half_precision_floating-point_format
%
% test it with:
% >> v = uint16( sscanf( '3c00 0400 7bff 0000 8000 c000 3555', '%x' ) )
% >> HPFtofloat( v )

    signBit = single( bitshift( bitand( hpf, 2^15 ), -15 ) );
    sign = (-1).^signBit;
    
    exponent = single( bitshift( bitand ( hpf, sum( 2.^(10:14) ) ), -10 ) );
    
    significand = single( bitand( hpf, sum( 2.^(0:9) ) ) ) + single( (exponent~=0) .* 2.^10 );
       
    f = ( exponent==0 ) .* sign .* 2.^(-14) .* significand .* 2^(-10) + ...
        ( exponent~=0 ) .* sign .* 2.^(exponent-15) .* significand .* 2^(-10) ;
    
    f=single(f);
    
end