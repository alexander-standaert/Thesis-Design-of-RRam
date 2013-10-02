function [] = mv( string )
% function [] = mv( string )
%
% invoke bash script
%
    eval(  [ '!mv ' string ] );

end