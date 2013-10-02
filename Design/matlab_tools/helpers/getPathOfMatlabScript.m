function [ scriptPath ] = getPathOfMatlabScript( scriptName ) 
%function [ scriptPath ] = getPathOfMatlabScript( scriptName ) 
%  returns the path in which the script that is executed when you type eval( scriptName )
%  is located
%
%  the full name of this script can be obtained with which(scriptname)
%
%  scriptName can include the '.m' at the end, but doesn't have to
%
%  scriptPath does not contain a trailing '/'

    scriptFullLocation = which( scriptName );
    [ scriptPath ]     = fileparts( scriptFullLocation );    
    
end