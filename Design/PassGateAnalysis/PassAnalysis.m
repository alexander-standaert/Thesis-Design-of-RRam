sp.PWpassN = 1e-7;
sp.PWpassP = 1e-7;

sp.nvtmismatch=0;
sp.pvtmismatch=0;
sp.nbetamismatch=0;
sp.pbetamismatch=0;
sp.sigmamult=1;

in=[0:0.05:1];
outinit=[0:0.05:1];

wavetemp1 = makewave('PassN',[0.5,1,0.5]*1e-9,[0,1,0]);
wavetemp2 = makewave('PassP',[0.5,1,0.5]*1e-9,[1,0,1]);
wavetempgroup = makewavegroup('tempgroup',[wavetemp1,wavetemp2]);
wave = calcwaves(wavetempgroup);
sp.passN = wave.PassN;
sp.passP = wave.PassP;

mega=allcomb(in,outinit);
diff1=zeros(length(mega),1);
diff2=zeros(length(mega),1);
diff3=zeros(length(mega),1);
diff4=zeros(length(mega),1);
diff5=zeros(length(mega),1);
diff6=zeros(length(mega),1);

for i=1:length(mega)
    sp.vin=mega(i,1);
    sp.outinit=mega(i,2);
    
    inputfile = 'Passtest.m2s';
    [currentpath,~,~] = fileparts(which(mfilename));
    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
    mat2spice(mat2spicepath,spicepath,sp)
    clear inputfile currentpath mat2spicepath spicepath

    system('spectre -64 +aps ./PassGateAnalysis/SPICE/Passtest.sp');
    sim = readPsfAscii(strcat('./PassGateAnalysis/SPICE/Passtest.raw/mymc-001_mytran.tran'), '.*');
    
    out1=sim.getSignal('outlvtcomp');
    t1=out1.getXValues;
    v1=out1.getYValues;
    [~, t] = min(abs(t1 - 1.5e-9));
    diff1(i)=v1(t)-sp.vin;
    out2=sim.getSignal('outhvtcomp');
    t2=out2.getXValues;
    v2=out2.getYValues;
    [~, t] = min(abs(t2 - 1.5e-9));
    diff2(i)=v2(t)-sp.vin;
    out3=sim.getSignal('outnlvt');
    t3=out3.getXValues;
    v3=out3.getYValues;
    [~, t] = min(abs(t3 - 1.5e-9));
    diff3(i)=v3(t)-sp.vin;
    out4=sim.getSignal('outplvt');
    t4=out4.getXValues;
    v4=out4.getYValues;
    [~, t] = min(abs(t4 - 1.5e-9));
    diff4(i)=v4(t)-sp.vin;
    out5=sim.getSignal('outnhvt');
    t5=out5.getXValues;
    v5=out5.getYValues;
    [~, t] = min(abs(t5 - 1.5e-9));
    diff5(i)=v5(t)-sp.vin;
    out6=sim.getSignal('outphvt');
    t6=out6.getXValues;
    v6=out6.getYValues;
    [~, t] = min(abs(t6 - 1.5e-9));
    diff6(i)=v6(t)-sp.vin;
    
end

levels=[1e-10:0.05:0.5];
% levels=[levels(1) 1e-9 levels(2:end)];

contour(in,outinit,vec2mat(abs(diff1),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Pedestrian error complementary LVT passgates','FontWeight','bold','FontSize',14);
figure
contour(in,outinit,vec2mat(abs(diff2),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Pedestrian error complementary HVT passgates','FontWeight','bold','FontSize',14);
figure
contour(in,outinit,vec2mat(abs(diff3),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Pedestrian error nMOS LVT passgates','FontWeight','bold','FontSize',14);
figure
contour(in,outinit,vec2mat(abs(diff4),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Pedestrian error pMOS LVT passgates','FontWeight','bold','FontSize',14);
figure
contour(in,outinit,vec2mat(abs(diff5),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Pedestrian error nMOS HVT passgates','FontWeight','bold','FontSize',14);
figure
contour(in,outinit,vec2mat(abs(diff6),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Pedestrian error pMOS HVT passgates','FontWeight','bold','FontSize',14);