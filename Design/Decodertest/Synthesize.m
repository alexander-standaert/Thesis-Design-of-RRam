sp.NoI=7;


sp.MismatchOn=0;
sp.numruns=1;
sp.simlength=3e-9;



inputfile = 'decodersynthesis.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre ./Decodertest/test.sp');