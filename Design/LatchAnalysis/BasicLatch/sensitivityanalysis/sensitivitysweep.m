sp.numruns = 1;
%sizing parameters
PWmin = 100e-9;

sp.PWp = PWmin;
sp.PWn = PWmin;
sp.PWpenable = PWmin;
sp.PWnenable = PWmin;
sp.PWpassN = PWmin;
sp.PWpassP = PWmin;

numberofsigma = [-4:1:4];
whichMismatch = eye(20);

offsets = [-0.3:0.005:0.3];

mega=allcomb(numberofsigma,[1:20]);

wavetemp1 = makewave('SAenP',[1.5,1,1]*1e-9,[1,0,1]);
wavetemp2 = makewave('SAenN',[1.5,1,1]*1e-9,[0,1,0]);
wavetemp3 = makewave('PassN',[0.5,0.9,1]*1e-9,[0,1,0]);
wavetemp4 = makewave('PassP',[0.5,0.9,1]*1e-9,[1,0,1]);
wavetempgroup = makewavegroup('tempgroup',[wavetemp1,wavetemp2,wavetemp3,wavetemp4]);
wave = calcwaves(wavetempgroup);
sp.enableP = wave.SAenP;
sp.enableN = wave.SAenN;
sp.passN = wave.PassN;
sp.passP = wave.PassP;

offset = zeros(size(mega,1),1);

for i=1:size(mega,1)
    sp.whichMismatch = whichMismatch(mega(i,2),:);
    sp.sigmamult = mega(i,1);
    latched = zeros(size(offsets,1),size(offsets,2));
    
    for j=1:size(offsets,2)
        sp.highlow=0.4+offsets(j);
        inputfile = 'sensitivity.m2s';
        [currentpath,~,~] = fileparts(which(mfilename));
        mat2spicepath = strcat(currentpath,'/',inputfile);
        spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
        mat2spice(mat2spicepath,spicepath,sp)
        clear inputfile currentpath mat2spicepath spicepath
        
        system('spectre -64 +aps ./LatchAnalysis/BasicLatch/sensitivityanalysis/SPICE/sensitivity.sp');
        
        sim = readPsfAscii(strcat('./LatchAnalysis/BasicLatch/sensitivityanalysis/SPICE/sensitivity.raw/mymc-001_mytran.tran'), '.*');
        
        a=sim.getSignal('out').getYValues;
        
        latched(j) = round(a(end));
    end
    blabla = find(diff(latched) ~= 0);
    if isempty(blabla)
        offset(i)=nan;
    else
        offset(i)=offsets(blabla+1);
    end
end

SensitivitySweep = [mega,offset];
save('./LatchAnalysis/BasicLatch/sensitivityanalysis/sensitivitydata.mat','SensitivitySweep')
