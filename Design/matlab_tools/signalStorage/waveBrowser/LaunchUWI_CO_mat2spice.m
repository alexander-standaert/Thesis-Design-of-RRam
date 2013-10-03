function Simspecs = LaunchUWI_CO_mat2spice(Simspecs,sp,Parent)
%
%  function LaunchUWI_CO_mat2spice(Simspecs,sp)
%
%   launch a simulation, using mat2spice as a parser, and the UWI-CO as a
%   format.
%
if(nargin <3)
    Parent = Simspecs;
end


%ignore list based on UMC90nm: to update for other technologies
%ignore the following warnings:
% - CMI-2424 , `Acde' = 61.4732 mm/V is unusually small.
% - Parasitic resistor `Rs' has been deleted because its value of x mOhm
% - SPECTRE-6006 , : x warnings suppressed.
% USIMDB-1203: there are floating node, ultrasim doesn't like it...
% USIMDB-1224: can't find element, because I erased it it myself...
% USIMDB-1070: too many probes, I'm scared, buh buh...
ignore_list={'CMI-2318','SPECTRE-6006','CMI-2424','USIMDB-1224','USIMDB-1203','USIMDB-1070'};


handle = @LaunchUWI_CO_mat2spice;

%checks if the Simspecs is a matlabstack . if so, just launch it
if(isfield(Simspecs,'launch'))
    % fprintf('calling launch\n');
    Simspecs = Simspecs.launch(Simspecs,sp,Parent,handle);
    return
end

if(isa(Simspecs , 'SimulationDeck.MatlabStack'))
    %   fprintf('calling launch\n')
    Simspecs.launch(sp,handle);
    return
end

%fprintf('launching directly\n')

%otherwise, gets the simulation statement
sp.Statement = buildSpectreStatement(Parent,sprintf('//simulation part...'));
path = pwd;
try
    name = sp.name;
    map = sprintf( 'run_%s', name );
    m2s = sprintf( '%s.m2s', name );
    runfile = sprintf( '%s_run.m', name );
    
    mat2spice( m2s, map, sp );
    %   moveRunFile = sprintf('!mv m2s_run.m %s',  map );
    %    eval( moveRunFile );
    tic
    change = sprintf('cd %s', map );
    eval(change);
    %buildRCs(Parent)
    [pre post] = buildCommand(Parent);
    command = sprintf( '%s runCO_UWISpectre.sh  %s.sp > out; %s',pre, name , post);
    system(command);
    read_warning('out',ignore_list)
    
catch error
    changeD = sprintf ('cd %s',path);
    eval(changeD);
    rethrow(error)
end
toc
changeD = sprintf ('cd %s',path);
eval(changeD);
end

function [pre_cmdParam post_cmdParam]=  buildCommand(Simspecs)
%embbeded command to move the Result wherever I want to...
pre_cmdParam = '';
for i=1:length(Simspecs.upperParent.uwiPath)
    pre_cmdParam = sprintf('%s export UWI_OUTPUT_MAP=${UWI_OUTPUT_MAP}%s ;',pre_cmdParam , Simspecs.upperParent.uwiPath{i});
end
[~, prev_uwiPath] = system('echo $UWI_OUTPUT_MAP');
%remove the eol character...
prev_uwiPath = prev_uwiPath(1:end-1);
post_cmdParam = sprintf(' export UWI_OUTPUT_MAP=%s ;',prev_uwiPath);


%create the directories to be used, if they don't...
addPath = '';
for i=1:length(Simspecs.upperParent.uwiPath)
    addPath = sprintf('%s%s',addPath,Simspecs.upperParent.uwiPath{i});
end
Idirs = strfind(addPath,'/');
for i=1:length(Idirs)
    if(Idirs(i)>1)
        directory = [prev_uwiPath addPath(1:Idirs(i)-1)];
        if(~exist(directory,'dir'))
            cmd = sprintf('!mkdir %s' , directory);
            eval(cmd);
        end
    end
end

end

function buildRCs(Simspecs)
%create params.rc, parameter file to change the UWI_OUTPUT_MAP, and post.rc
%to restore it afterwhile
[~, prev_uwiPath] = system('echo $UWI_OUTPUT_MAP');
%remove the eol character...
prev_uwiPath = prev_uwiPath(1:end-1);
%erase the previous params.rc and post.rc
if(exist('./params.rc','file'))
    !rm ./params.rc
end
if(exist('./params.rc','file'))
    !rm ./post.rc
end
%creates the params.rc and post.rc
if( ~isempty(Simspecs.upperParent.uwiPath) )
    fid_params = fopen('./params.rc','w+');
    for i=1:length(Simspecs.upperParent.uwiPath)
        cmdParam = sprintf(' export UWI_OUTPUT_MAP=${UWI_OUTPUT_MAP}%s\n',Simspecs.upperParent.uwiPath{i});
        fwrite(fid_params,cmdParam);
    end
    fclose(fid_params);
    
    %creates the post.rc
    fid_post = fopen('./post.rc','w+');
    fwrite(fid_post,sprintf(' export UWI_OUTPUT_MAP=%s',prev_uwiPath));
    fclose(fid_post);
    
end

%create the directories to be used, if they don't...
addPath = '';
for i=1:length(Simspecs.upperParent.uwiPath)
    addPath = sprintf('%s%s',addPath,Simspecs.upperParent.uwiPath{i});
end
Idirs = strfind(addPath,'/');
for i=1:length(Idirs)
    if(Idirs(i)>1)
        directory = [prev_uwiPath addPath(1:Idirs(i)-1)];
        if(~exist(directory,'dir'))
            cmd = sprintf('!mkdir %s' , directory);
            eval(cmd);
        end
    end
end


end