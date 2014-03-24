DecoderData = zeros(9,5);

for i=2:10
    [Emean,E_extreme,tdmean,td_extreme]=Synthesize(i);
    DecoderData(i-1,1)=i;
    DecoderData(i-1,2)=tdmean;
    DecoderData(i-1,3)=Emean;
    DecoderData(i-1,4)=E_extreme;
    DecoderData(i-1,5)=td_extreme;
    
end

save('./ArchitectureAnalysis/decoderdata.mat','DecoderData')
