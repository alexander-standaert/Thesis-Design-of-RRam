function m2s = m2s_run9316(m2s,sp);function m2s_outstr = m2s_arg2str(m2s_instr);m2s_outstr = m2s_instr;for m2s_I=1:length(m2s_instr);if isnumeric(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);end;elseif islogical(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});end;end;end;end;function m2s_outstr=m2s_cell2str(m2s_instr);m2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf('\n')],m2s_instr,'UniformOutput',0));m2s_outstr=m2s_outstr(1:end-1);end;function varargout = m2s_emptyfn(varargin);throwAsCaller(MException('M2S:FnErr','function called before it has been initialized with $include, $insert or $import'));end;
m2s_file_sizingsim();
function m2s_file_sizingsim(); m2s.sizingsim.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.sizingsim.currentline=m2s.sizingsim.currentline+1;m2s.sizingsim.outstr{m2s.sizingsim.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('simulator lang=spice',{});
m2s_write('.lib ''tech_wrapper.lib'' tt',{});
m2s_write('',{});
m2s_write('simulator lang=spectre',{});
m2s_write('',{});
m2s_write('include "monte_carlo_models.scs"',{});
m2s_write('include "decoder.sp"',{});
m2s_write('include "parameters2.sp"',{});
m2s_write('',{});
m2s_write('xdecoder (%s enable %s vdd vss NBulkLine PBulkLine) decoder%s // %s',{bus('IN',[0:sp.NoI-1]),bus('TEMP_0',[0:2^sp.NoI-1]),sp.NoISTRING,busconnect('multstage','dec1multstage',[1:decoderparameters(sp.NoI)])});
for i=0:2^sp.NoI-1
m2s_write('cLoad%s (OUT_%s 0) capacitor c=%s',{i,i,sp.CL});
end
m2s_write('',{});
for i=0:sp.NoIS-2
for j=0:2^sp.NoI-1
m2s_write('xNOT_%s_%s (TEMP_%s_%s TEMP_%s_%s vdd vss PBulkLine NBulkLine) inverter mult=%s',{i,j,i,j,i+1,j,sp.invsize{i+1}});
end
end
for j=0:2^sp.NoI-1
m2s_write('xNOT_%s_%s (TEMP_%s_%s OUT_%s vdd vss PBulkLine NBulkLine) inverter mult=%s',{sp.NoIS-1,j,sp.NoIS-1,j,j,sp.invsize{sp.NoIS}});
end
m2s_write('',{});
m2s_write('Vvdd     ( vdd     0 ) vsource dc=1',{});
m2s_write('VvddBulk ( PBulkLine 0 ) vsource dc=1',{});
m2s_write('Vvss     ( vss     0 ) vsource dc=0',{});
m2s_write('VvssBulk ( NBulkLine 0 ) vsource dc=0',{});
m2s_write('',{});
m2s_write('Ven (enable 0) vsource type=pwl wave=waveen',{});
m2s_write('',{});
for i=0:sp.NoI-1
m2s_write('Vin%s (IN%s 0) vsource type=pwl wave=wavein%s',{i,strcat('_',int2str(i)),strcat('_',int2str(i))});
end
m2s_write('',{});
m2s_write('',{});
m2s_write('save %s enable %s Vvdd:currents',{bus('IN',[0:sp.NoI-1]),bus('OUT',[0:2^sp.NoI-1])});
m2s_write('',{});
m2s_write('mymc montecarlo',{});
m2s_write('+ donominal=no variations=mismatch',{});
m2s_write('+ seed=1234',{});
m2s_write('+ numruns=numberofruns',{});
m2s_write('+ firstrun=1',{});
m2s_write('+ saveprocessparams=yes',{});
m2s_write('+ savefamilyplots= yes {',{});
m2s_write('mytran tran stop=simlength',{});
m2s_write('}',{});
m2s_write('',{});
m2s_write('option1 options rawfmt = psfascii',{});
end
end