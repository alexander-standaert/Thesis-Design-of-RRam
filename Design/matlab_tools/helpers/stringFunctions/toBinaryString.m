function [ str ] = toBinaryString( number, digits )
% function [ str ] = toBinaryString( number, digits )

str='';
for i=0:(digits-1)
  t=mod( floor(number/(2^i)),2 );
  str=sprintf('%d%s', t, str );
end




