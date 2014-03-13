function m2s = m2s_run630412(m2s,sp);function m2s_outstr = m2s_arg2str(m2s_instr);m2s_outstr = m2s_instr;for m2s_I=1:length(m2s_instr);if isnumeric(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);end;elseif islogical(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});end;end;end;end;function m2s_outstr=m2s_cell2str(m2s_instr);m2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf('\n')],m2s_instr,'UniformOutput',0));m2s_outstr=m2s_outstr(1:end-1);end;function varargout = m2s_emptyfn(varargin);throwAsCaller(MException('M2S:FnErr','function called before it has been initialized with $include, $insert or $import'));end;
m2s_file_parameters2();
function m2s_file_parameters2(); m2s.parameters2.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.parameters2.currentline=m2s.parameters2.currentline+1;m2s.parameters2.outstr{m2s.parameters2.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('',{});
m2s_write('simulator lang=spectre',{});
m2s_write('',{});
m2s_write('parameters PWmin = 100n                         //MinimalTransistorWidth',{});
m2s_write('parameters PLmin = 45n                          //MinimalTransistorLenght',{});
m2s_write('        ',{});
m2s_write('parameters numberofruns = %s',{sp.numruns});
m2s_write('parameters enableMismatch = %s  ',{sp.MismatchOn});
m2s_write('parameters simlength = %s',{sp.simlength});
m2s_write('',{});
m2s_write('parameters wavein = %s',{sp.wavein});
end
end