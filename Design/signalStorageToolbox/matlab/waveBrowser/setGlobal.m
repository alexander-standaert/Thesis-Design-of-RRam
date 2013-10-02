function newVal = setGlobal(varname,newVal)
%
%  new_var = setGlobal(varname,newVal)
%
% set up the global variable varname to newVal
% newVal can be a value, or 'keep', or 'switch'.
% return the new value.

%fprintf('updating: %s',varname)


if(exist(varname) > 1) 
    error('%s already exist, is not a variable',varname)
end

globally = sprintf( 'global %s',varname) ;
eval(globally);



val = eval(varname);
if isempty(val)
   val = 0; 
end

if(nargin<2 || strcmp(newVal,'keep') )
    newVal = val;
end

if(strcmp(newVal,'switch'))
    newVal = ~val ;
end

eval(sprintf('%s=newVal;',varname));


end