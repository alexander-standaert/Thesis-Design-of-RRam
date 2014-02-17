DecoderData = zeros(6,3);

for i=2:7
    [~,E,td]=Synthesize(i);
    DecoderData(i-1,1)=i;
    DecoderData(i-1,2)=td;
    DecoderData(i-1,3)=E;
end

save('./ArchitectureAnalysis/decoderdata.mat','DecoderData')