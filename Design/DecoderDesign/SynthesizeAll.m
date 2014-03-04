strsum = './ArchitectureDesign/SPICE/intro.sp ';
for i=1:10
sp.NoI=i;

sp.NoISTRING = int2spelledstring(i);

inputfile = 'decodersynthesis.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

string=strcat(int2str(i));

system(strcat('mv ./DecoderDesign/SPICE/decodersynthesis.sp ./ArchitectureDesign/SPICE/decoder',string,'.sp'));
strsum = strjoin({strsum, strcat('./ArchitectureDesign/SPICE/decoder',string,'.sp ')});

end

system(strjoin({'cat ',strsum,'> ./ArchitectureDesign/SPICE/decoder.sp'}));

for i=1:10
    string=strcat(int2str(i));
    system(strcat('rm ./ArchitectureDesign/SPICE/decoder',string,'.sp'));
end