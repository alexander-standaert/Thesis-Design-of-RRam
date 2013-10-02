function [ output ] = generate_inputFFs( name, input, inputBar, bitvalues )
%% output = init_register( name, input, inputBar, initial bitvalues )
%% 
%% example: 
%% generate_register( 'decoder_cDelay', 'in', 'inBar', [ 0 0 1 1 ] )
%% results in (with the bus-statements expanded)
%% >Xdecoder_cdelay ( vdd vss vddBulk vssBulk 
%% >+                 in inBar 
%% >+                 phase_1 phase_2 asyncreset
%% >+                 $<bus('decoder_cDelay',0:3)>$ $<bus('decoder_cDelayBar',0:3)>$ ) IO_INPUTSR_FF_4
%% >nodeset Xdecoder_cdelay.Xff_0.Q1    = 0
%% >nodeset Xdecoder_cdelay.Xff_0.QBar1 = 1
%% >nodeset Xdecoder_cdelay.Xff_0.Q     = 0
%% >nodeset Xdecoder_cdelay.Qff_0.QBar  = 1
%% >
%% >nodeset Xdecoder_cdelay.Xff_1.Q1    = 0
%% >nodeset Xdecoder_cdelay.Xff_1.QBar1 = 1
%% >nodeset Xdecoder_cdelay.Xff_1.Q     = 0
%% >nodeset Xdecoder_cdelay.Xff_1.QBar  = 1
%% >
%% >nodeset Xdecoder_cdelay.Xff_2.Q1    = 1
%% >nodeset Xdecoder_cdelay.Xff_2.QBar1 = 0
%% >nodeset Xdecoder_cdelay.Xff_2.Q     = 1
%% >nodeset Xdecoder_cdelay.Xff_2.QBar  = 0
%% >
%% >nodeset Xdecoder_cdelay.Xff_3.Q1    = 1
%% >nodeset Xdecoder_cdelay.Xff_3.QBar1 = 0
%% >nodeset Xdecoder_cdelay.Xff_3.Q     = 1
%% >nodeset Xdecoder_cdelay.Xff_3.QBar  = 0


L= length( bitvalues );
I = 0:(L-1);

%% >Xdecoder_cdelay ( vdd vss vddBulk vssBulk 
text=sprintf(  'X%s ( vdd vss vddBulk vssBulk\n',name);
%% >+                 in inBar 
text=sprintf('%s+     %s %s\n',text,input, inputBar);
%% >+                 phase_1 phase_2 asyncreset
text=sprintf('%s+     phase_1 phase_2 asyncreset \n',text );
%% >+                 $<bus('decoder_cDelay',0:3)>$ $<bus('decoder_cDelayBar',0:3)>$ ) IO_INPUTSR_FF_4
text=sprintf('%s+     %s\n',text, bus(name,I));
text=sprintf('%s+     %s\n',text, bus([ name 'Bar'],I));
text=sprintf('%s+   ) IO_INPUTSR_FF_%d\n',text, L );
for j=I
  % >nodeset Xdecoder_cdelay.Xff_0.Q1    = 0
  text=sprintf('%snodeset X%s.Xff_%d.Q1=%f\n',text, name, j, bitvalues(j+1) );
  text=sprintf('%sic X%s.Xff_%d.Q1=%f\n',text, name, j, bitvalues(j+1) );  
  % >nodeset Xdecoder_cdelay.Xff_0.QBar1 = 1
  text=sprintf('%snodeset X%s.Xff_%d.QBar1=%f\n',text, name, j, 1-bitvalues(j+1) );
  text=sprintf('%sic X%s.Xff_%d.QBar1=%f\n',text, name, j, 1-bitvalues(j+1) );
  % >nodeset Xdecoder_cdelay.Xff_0.Q     = 0
  text=sprintf('%snodeset X%s.Xff_%d.Q=%f\n',text, name, j, bitvalues(j+1) );
  text=sprintf('%sic X%s.Xff_%d.Q=%f\n',text, name, j, bitvalues(j+1) );
  % >nodeset Xdecoder_cdelay.Qff_0.QBar  = 1
  % >
  text=sprintf('%snodeset X%s.Xff_%d.QBar=%f\n\n',text, name, j, 1-bitvalues(j+1) );
  text=sprintf('%sic X%s.Xff_%d.QBar=%f\n\n',text, name, j, 1-bitvalues(j+1) );

end

output = text;
