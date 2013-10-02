function read_warning( fname , ignore_list )
%
%  function read_warning( fname , ignore_list )
%
%  dysplay every (spetre/ultrasim) warning written in the fname file
%  (typically a simulation output from spectre) , except for the warning
%  IDs given in the ignore list cell array. in addition, output the single
%  connected nodes...
%  ex:
%  read_warning('run_mysim/out')
%  
%  read_warninf('run_mysim/out' , {'USIMMOD-7051'} )
%
if(nargin <2 )
    ignore_list = {}; 
end
fid = fopen(fname,'r');
next_line = fgetl(fid);
while(isempty(ferror(fid)) )
    next_line = fgetl(fid);
    i = regexp(next_line , '\s*WARNING\s+\((?<flag>\S*)\)(?<msg>.*)','names');
    err = regexp(next_line , '\s*ERROR\s+\((?<flag>\S*)\)(?<msg>.*)','names');
    if(~isempty(i) && isempty(find(strcmp(i(1).flag , ignore_list), 1)))
        fprintf('WAR: %s , %s\n' , i(1).flag , i(1).msg);
    elseif(~isempty(err))
        fprintf('ERR: %s , %s\n' , err(1).flag , err(1).msg);
    end
    u = regexp(next_line , '\s+Only one connection to (node|the following) ','match');
    if(~isempty(u))
        fprintf('%s\n',next_line)
        done = false;
        while ~done
            next_line = fgetl(fid);
            v = regexp(next_line,'^\s+(?<node>\S*)\s*$','names');
            if(isempty(v))
                done = true;
            else
                fprintf('node: %s\n',v.node);
            end
           %fprintf(next_line) 
        end
    end
    
    
end
fclose(fid);