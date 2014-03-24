function m2s = m2s_run70335(m2s,sp);function m2s_outstr = m2s_arg2str(m2s_instr);m2s_outstr = m2s_instr;for m2s_I=1:length(m2s_instr);if isnumeric(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);end;elseif islogical(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});end;end;end;end;function m2s_outstr=m2s_cell2str(m2s_instr);m2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf('\n')],m2s_instr,'UniformOutput',0));m2s_outstr=m2s_outstr(1:end-1);end;function varargout = m2s_emptyfn(varargin);throwAsCaller(MException('M2S:FnErr','function called before it has been initialized with $include, $insert or $import'));end;
m2s_file_parameters();
function m2s_file_parameters(); m2s.parameters.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.parameters.currentline=m2s.parameters.currentline+1;m2s.parameters.outstr{m2s.parameters.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('',{});
m2s_write('simulator lang=spectre',{});
m2s_write('',{});
m2s_write('parameters vdd = %s',{sp.vdd});
m2s_write('',{});
m2s_write('parameters PWmin = 100n                         //MinimalTransistorWidth',{});
m2s_write('parameters PLmin = 45n                          //MinimalTransistorLenght',{});
m2s_write('parameters WChargeBL = %s         //BitLineChargerWidth(perBL)',{sp.WChargeBL});
m2s_write('parameters LChargeBL = %s',{sp.LChargeBL});
m2s_write('parameters WDischargeBL = %s   //BitLineDischargerWidth(perBL)',{sp.WDischargeBL});
m2s_write('parameters WDischargeSL = %s   //SourceLineDischargerWidth(perBL)',{sp.WDischargeSL});
m2s_write('parameters Cpar = 0.18e-15                      //ParasiticCapacitor(perCell)',{});
m2s_write('parameters PWn = %s                     //DifferentialNpairWidth(perSA)',{sp.PWn});
m2s_write('parameters PWp = %s                     //DifferentialPpairWidth(perSA)',{sp.PWp});
m2s_write('parameters PWpenable = %s         //SenseAmpEnablePWidth(perSA)',{sp.PWpenable});
m2s_write('parameters PWnenable = %s         //SenseAmpEnableNWidth(perSA)',{sp.PWnenable});
m2s_write('parameters PWmuxLB = %s                //PassgateWidth(perMuxLB)',{sp.PWMmuxLB});
m2s_write('parameters PWmuxGB = %s                //PassgateWidth(perMuxGB)',{sp.PWMmuxGB});
m2s_write('',{});
m2s_write('parameters numberofruns = %s',{sp.numruns});
m2s_write('parameters enableMismatch = %s   //Mismatch',{sp.MismatchOn});
m2s_write('parameters simlength = %s',{sp.simlength});
m2s_write('',{});
m2s_write('',{});
m2s_write('parameters RMEMHigh = 32500;',{});
m2s_write('parameters RMEMLow = 7500;',{});
m2s_write('',{});
for i=0:0
for j=0:1
for k=0:sp.NoBLpLB-1
for l=0:sp.NoWLpB-1
if sp.randomizecells 
   if rand > 0.5
m2s_write('parameters Rcell_%s_%s_%s_%s = RMEMHigh',{i,j,k,l});
   else
m2s_write('parameters Rcell_%s_%s_%s_%s = RMEMLow',{i,j,k,l});
   end
else
m2s_write('parameters Rcell_%s_%s_%s_%s = %s',{i,j,k,l,sp.RMEMvalue});
end
end
end
end
end
m2s_write('',{});
for i=0:1:sp.NoBLpLB-1
if sp.refcells(i+1)
m2s_write('parameters Rref_%s = RMEMHigh',{i});
else
m2s_write('parameters Rref_%s = RMEMLow',{i});
end
end
m2s_write('',{});
m2s_write('',{});
for i=0:sp.NoGB-1
m2s_write('parameters waveEnGB%s=%s',{strcat('_',int2str(i)),sp.wavesin{i+1}});
end
for i=0:1
m2s_write('parameters waveEnLB%s=%s',{strcat('_',int2str(i)),sp.wavesin{sp.NoGB+i+1}});
end
for i=0:log2(sp.NoBLpLB)-1
m2s_write('parameters waveBLstart%s=%s',{strcat('_',int2str(i)),sp.wavesin{sp.NoGB+2+i+1}});
end
for i=0:log2(sp.NoWLpB)-1
m2s_write('parameters waveWLstart%s=%s',{strcat('_',int2str(i)),sp.wavesin{sp.NoGB+2+log2(sp.NoBLpLB)+i+1}});
end
m2s_write('parameters wave_SA_SH = %s',{sp.SA_SH});
m2s_write('parameters wave_SAN = %s',{sp.en_SAN});
m2s_write('parameters wave_SAP = %s',{sp.en_SAP});
end
end