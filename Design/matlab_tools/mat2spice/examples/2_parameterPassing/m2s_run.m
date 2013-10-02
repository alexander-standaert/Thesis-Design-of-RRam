function m2s = m2s_run(m2s,sp,description);function m2s_outstr = m2s_arg2str(m2s_instr);m2s_outstr = m2s_instr;for m2s_I=1:length(m2s_instr);if isnumeric(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);end;elseif islogical(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});end;end;end;end;function m2s_outstr=m2s_cell2str(m2s_instr);m2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf('\n')],m2s_instr,'UniformOutput',0));m2s_outstr=m2s_outstr(1:end-1);end;function varargout = m2s_emptyfn(varargin);throwAsCaller(MException('M2S:FnErr','function called before it has been initialized with $include, $insert or $import'));end;
m2s_file_example();
function m2s_file_example(); m2s.example.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.example.currentline=m2s.example.currentline+1;m2s.example.outstr{m2s.example.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('example file: show how to pass parameters from matlab to the m2s script',{});
m2s_write('',{});
% mat2spice is called from matlab as  mat2spice( m2s, targetFolder, params )
%
% the provided parameters are available in the m2s file under the same
% name as they are called in the call
%
% e.g.  mat2spice( 'example.m2s', 'output', sp, description )
%
% allows the m2s file to access the values of sp and name
%
% In case sp is a structure with sp.key and sp.value, and 
% description is a string, the following should work:
m2s_write('',{});
m2s_write('sp key      = %s',{sp.key});
m2s_write('sp value    = %s',{sp.value});
m2s_write('description = %s',{description});
m2s_write('',{});
m2s_write('',{});
% NOTE: some people prefer to only pass a single structure called sp
end
end