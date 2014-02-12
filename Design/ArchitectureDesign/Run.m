sp.NoWLpB=8;
sp.NoBLpLB=10;
sp.NoLBpSA=6;

inputfile = 'branch.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

inputfile = 'mux.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

inputfile = 'localblock.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

inputfile = 'globalblock.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath