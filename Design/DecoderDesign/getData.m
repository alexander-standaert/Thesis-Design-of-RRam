DecoderData1 = zeros(9,5);
DecoderData2 = zeros(9,5);


for i=2:10
    [Emean,E_extreme,tdmean,td_extreme]=Synthesize(i,1);
    DecoderData1(i-1,1)=i;
    DecoderData1(i-1,2)=tdmean;
    DecoderData1(i-1,3)=Emean;
    DecoderData1(i-1,4)=E_extreme;
    DecoderData1(i-1,5)=td_extreme;    
end
for i=2:10
    [Emean,E_extreme,tdmean,td_extreme]=Synthesize(i,2);
    DecoderData2(i-1,1)=i;
    DecoderData2(i-1,2)=tdmean;
    DecoderData2(i-1,3)=Emean;
    DecoderData2(i-1,4)=E_extreme;
    DecoderData2(i-1,5)=td_extreme;    
end

save('./ArchitectureAnalysis/decoderdata.mat','DecoderData1','DecoderData2')
