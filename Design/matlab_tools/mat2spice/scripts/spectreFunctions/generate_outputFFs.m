function [ output ] = generate_outputFFs( name, nameBar, out, bitvalues )
%% output = init_register( name, nameBar, out, initial bitvalues )
%% 
%% example: 
%% generate_outputFFs( 'dataBitBuffered', 'dataBitBar', 'outChain', [ 0 0 1 1 ] )
%% results in (with the bus-statements expanded)
%% >XdatatBitBuffered ( vdd vss vddBulk vssBulk
%% >+                 $<bus('dataBitBuffered',0:3)>$ $<bus('dataBitBar',0:3)>$ 
%% >+                 vdd vss 
%% >+                 phase_1 phase_2 load asyncreset
%% >+                 outChain outChainBar ) IO_OUTPUTSR_FF_4
%% >nodeset XdataBitBuffered.Xff_0.Q1    = 0
%% >nodeset XdataBitBuffered.Xff_0.QBar1 = 1
%% >nodeset XdataBitBuffered.Xff_0.Q     = 0
%% >nodeset XdataBitBuffered.Qff_0.QBar  = 1
%% >
%% >nodeset XdataBitBuffered.Xff_1.Q1    = 0
%% >nodeset XdataBitBuffered.Xff_1.QBar1 = 1
%% >nodeset XdataBitBuffered.Xff_1.Q     = 0
%% >nodeset XdataBitBuffered.Xff_1.QBar  = 1
%% >
%% >nodeset XdataBitBuffered.Xff_2.Q1    = 1
%% >nodeset XdataBitBuffered.Xff_2.QBar1 = 0
%% >nodeset XdataBitBuffered.Xff_2.Q     = 1
%% >nodeset XdataBitBuffered.Xff_2.QBar  = 0
%% >
%% >nodeset XdataBit.Xff_3.Q1    = 1
%% >nodeset XdataBit.Xff_3.QBar1 = 0
%% >nodeset XdataBit.Xff_3.Q     = 1
%% >nodeset XdataBit.Xff_3.QBar  = 0


L= length( bitvalues );
I = 0:(L-1);

%% >Xdecoder_cdelay ( vdd vss vddBulk vssBulk
text=sprintf(  'X%s ( vdd vss vddBulk vssBulk\n',name);
%% >+                 $<bus('dataBit',0:3)>$ $<bus('dataBitBar',0:3)>$ 
text=sprintf('%s+     %s\n',text, bus(name   ,I));
text=sprintf('%s+     %s\n',text, bus(nameBar,I));
%% >+                 vdd vss 
text=sprintf('%s+     vdd vss\n', text);
%% >+                 phase_1 phase_2 load asyncreset
text=sprintf('%s+     phase_1 phase_2 load asyncreset \n',text );
%% >+                 outChain outChainBar ) IO_OUTPUTSR_FF_4
text=sprintf('%s+     %s       %sBar       ) IO_OUTPUTSR_FF_%d\n',text,  out, out, L );
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
