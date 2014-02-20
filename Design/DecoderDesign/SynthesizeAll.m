strsum = './ArchitectureDesign/SPICE/intro.sp ';
for i=1:7
sp.NoI=i;
if sp.NoI==1
    sp.NoISTRING = 'one';
elseif sp.NoI==2
    sp.NoISTRING = 'two';
elseif sp.NoI==3
    sp.NoISTRING = 'three';
elseif sp.NoI==4
    sp.NoISTRING = 'four';
elseif sp.NoI==5
    sp.NoISTRING = 'five';
elseif sp.NoI==6
    sp.NoISTRING = 'six';
elseif sp.NoI==7
    sp.NoISTRING = 'seven';
end

inputfile = 'decodersynthesis1to7.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

string=strcat(int2str(i));

system(strcat('mv ./DecoderDesign/SPICE/decodersynthesis1to7.sp ./ArchitectureDesign/SPICE/decoder',string,'.sp'));
strsum = strjoin({strsum, strcat('./ArchitectureDesign/SPICE/decoder',string,'.sp ')});

end
for i=8:10
    sp.NoI=i;
    if sp.NoI==8
        sp.NoISTRING = 'eight';
    elseif sp.NoI==9
        sp.NoISTRING = 'nine';
    elseif sp.NoI==10
        sp.NoISTRING = 'ten';
    end
    inputfile = 'decodersynthesis8to10.m2s';
    [currentpath,~,~] = fileparts(which(mfilename));
    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
    mat2spice(mat2spicepath,spicepath,sp)
    clear inputfile currentpath mat2spicepath spicepath
    
    string=strcat(int2str(i));
    
    system(strcat('mv ./DecoderDesign/SPICE/decodersynthesis8to10.sp ./ArchitectureDesign/SPICE/decoder',string,'.sp'));
    strsum = strjoin({strsum, strcat('./ArchitectureDesign/SPICE/decoder',string,'.sp ')});
end

system(strjoin({'cat ',strsum,'> ./ArchitectureDesign/SPICE/decoder.sp'}));

for i=1:10
    string=strcat(int2str(i));
    system(strcat('rm ./ArchitectureDesign/SPICE/decoder',string,'.sp'));
end