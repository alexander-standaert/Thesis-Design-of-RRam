mismatch_on = 0;

n=5;

pmult = 8;
nmult = 4;
DV = [0.01:0.1:(n+1)*0.1];
Vx = 0.4;


for i=1:n
    
    inputfile = 'LightLatch.m2s';

    [currentpath,~,~] = fileparts(which(mfilename));

    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
    % transistor sizes										
    sp.pmult = pmult(1);
    sp.nmult = nmult(1);	
    sp.outinit = Vx(1);
    sp.outbarinit = Vx(1)+DV(i);

    if mismatch_on == 1
        At = 3*10^-3*10^-6; %3mV/um
   
        sp.mismatch_latch = repmat({''},8,2);
        %mismatch vt

        sp.mismatch_latch(3,1)={['m_vt=',randnormal(0,sqrt(At^2/(pmult*45e-9)))]}; % M3
        sp.mismatch_latch(4,1)={'m_vt=0'}; % M4
        sp.mismatch_latch(5,1)={['m_vt=',randnormal(0,sqrt(At^2/(nmult*45e-9)))]}; % M5
        sp.mismatch_latch(6,1)={'m_vt=0'}; % M6
        sp.mismatch_latch(7,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M7
        sp.mismatch_latch(8,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M8
   
        %mismatch B
        sp.mismatch_latch(1,2)={'m_B=0'}; % M1
        sp.mismatch_latch(2,2)={'m_B=0'}; % M2
        sp.mismatch_latch(3,2)={'m_B=0'}; % M3
        sp.mismatch_latch(4,2)={'m_B=0'}; % M4
        sp.mismatch_latch(5,2)={'m_B=0'}; % M5
        sp.mismatch_latch(6,2)={'m_B=0'}; % M6
        sp.mismatch_latch(7,2)={'m_B=0'}; % M7
        sp.mismatch_latch(8,2)={'m_B=0'}; % M8
    else
        sp.mismatch_latch = repmat({''},8,2);
    end

    mat2spice(mat2spicepath,spicepath,sp);
    clear inputfile currentpath mat2spicepath spicepath
    

    inputfile = 'sweepLatchTB.m2s';

    [currentpath,~,~] = fileparts(which(mfilename));

    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
    % parameters
    sp.steptime = 10^-12;
    sp.stoptime = 3*10^-9;
    
    % sp.LE1 = wavegen([0,1e-9;1,0],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
    % sp.LE2 = wavegen([0,1e-9;0,1],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate

    if mismatch_on == 1
        sp.transistor_type = 'mm';
    else
        sp.transistor_type = 'mc';
    end

    mat2spice(mat2spicepath,spicepath,sp);
    clear inputfile currentpath mat2spicepath spicepath

    
    system('spectre -format psfascii ./Sa/sa1/spice/sweepLatchTB.sp > /dev/null');
    [sim tree] = readPsfAscii('./Sa/sa1/spice/sweepLatchTB.raw/ana.tran', '.*');

outres=sim.getSignal('out').getYValues;
%outbarres(:,i)=sim.getSignal('outbar').getYValues;
time=sim.getSignal('out').getXValues;


plot(time,outres);
hold all

end


