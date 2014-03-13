strsum = './ArchitectureDesign/SPICE/intro.sp ';
for i=1:50
sp.NoD=i;
sp.NoDSTRING = int2spelledstring(i);

inputfile = 'delaysynthesis.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

string=strcat(int2str(i));

system(strcat('mv ./DelaySynthesis/SPICE/delaysynthesis.sp ./ArchitectureDesign/SPICE/delay',string,'.sp'));
strsum = strjoin({strsum, strcat('./ArchitectureDesign/SPICE/delay',string,'.sp ')});

end

system(strjoin({'cat ',strsum,'> ./ArchitectureDesign/SPICE/delay.sp'}));

for i=1:50
    string=strcat(int2str(i));
    system(strcat('rm ./ArchitectureDesign/SPICE/delay',string,'.sp'));
end