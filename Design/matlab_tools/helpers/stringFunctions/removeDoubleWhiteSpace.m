function [out] = removeDoubleWhiteSpace( in )
%% function [out] = removeDoubleWhiteSpace( in )
%%
%% change all tabs to spaces
%% remove all multi-whitespace segments

tab = sprintf('\t');
a=strrep( in, tab, ' ');


keep=[];
previousWasSpace=0;
for i=1:length(a)
   
    if a(i)==' '
        if previousWasSpace==1
           %skip this one 
        else
           keep(end+1) = i; 
           previousWasSpace=1;            
        end

    else
        keep(end+1) = i;
        previousWasSpace=0;
    end
    
end

out = a( keep );
