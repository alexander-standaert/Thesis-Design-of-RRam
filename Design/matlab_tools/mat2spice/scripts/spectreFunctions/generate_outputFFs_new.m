function [ output ] = generate_outputFFs_new( name, serialIn, serialInBar, parallelIn, serialOut, bitvalues )
% output = generate_outputFFs( name, serialIn, serialInBar, parallelIn,
%                              serialOut, bitvalues )
% 
% example: 
% generate_outputFFs( 'mySegment', 'previous', 'previousBar', 'dataBits', 'outChain', [ 0 0 1 1 ] )
%% results in (with the bus-statements expanded)
% >XmySegment ( vdd vss vddBulk vssBulk
% >+                 $<bus('dataBits',0:3)>$ $<bus('dataBitsBar',0:3)>$ 
% >+                 previous previousBar 
% >+                 phase_1 phase_2 load asyncreset
% >+                 outChain outChainBar ) IO_OUTPUTSR_FF_4
% >nodeset XmySegment.Xff_0.Q1    = 0
% >nodeset XmySegment.Xff_0.QBar1 = 1
% >nodeset XmySegment.Xff_0.Q     = 0
% >nodeset XmySegment.Qff_0.QBar  = 1
% >
% >nodeset XmySegment.Xff_1.Q1    = 0
% >nodeset XmySegment.Xff_1.QBar1 = 1
% >nodeset XmySegment.Xff_1.Q     = 0
% >nodeset XmySegment.Xff_1.QBar  = 1
% >...
% >nodeset XmySegment.Xff_3.Q1    = 1
% >nodeset XmySegment.Xff_3.QBar1 = 0
% >nodeset XmySegment.Xff_3.Q     = 1
% >nodeset XmySegment.Xff_3.QBar  = 0


L= length( bitvalues );
I = 0:(L-1);

%% >Xdecoder_cdelay ( vdd vss vddBulk vssBulk
text=sprintf(  'X%s ( vdd vss vddBulk vssBulk\n',name);
%% >+                 $<bus('dataBit',0:3)>$ $<busNegated('dataBit',0:3)>$ 
text=sprintf('%s+     %s\n',text, bus(parallelIn, I));
text=sprintf('%s+     %s\n',text, busNegated(parallelIn, I));
%% >+                 previous previousBar 
text=sprintf('%s+     %s  %s\n', text, serialIn, serialInBar );
%% >+                 phase_1 phase_2 load asyncreset
text=sprintf('%s+     phase_1 phase_2 load asyncreset \n',text );
%% >+                 outChain outChainBar ) IO_OUTPUTSR_FF_4
text=sprintf('%s+     %s       %sBar       ) IO_OUTPUTSR_FF_%d\n',text,  serialOut, serialOut, L );
for j=I
  %% >nodeset XdataBit.Xff_0.Q1    = 0
  text=sprintf('%snodeset X%s.Xff_%d.Q1=%f\n',text, name, j, bitvalues(j+1) );
  %% >nodeset XdataBit.Xff_0.QBar1 = 1
  text=sprintf('%snodeset X%s.Xff_%d.QBar1=%f\n',text, name, j, 1-bitvalues(j+1) );
  %% >nodeset XdataBit.Xff_0.Q     = 0
  text=sprintf('%snodeset X%s.Xff_%d.Q=%f\n',text, name, j, bitvalues(j+1) );
  %% >nodeset XdataBit.Qff_0.QBar  = 1
  %% >
  text=sprintf('%snodeset X%s.Xff_%d.QBar=%f\n\n',text, name, j, 1-bitvalues(j+1) );
end

output = text;
