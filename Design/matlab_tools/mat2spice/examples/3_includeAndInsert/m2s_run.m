function m2s = m2s_run(m2s,sp);function m2s_outstr = m2s_arg2str(m2s_instr);m2s_outstr = m2s_instr;for m2s_I=1:length(m2s_instr);if isnumeric(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);end;elseif islogical(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});end;end;end;end;function m2s_outstr=m2s_cell2str(m2s_instr);m2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf('\n')],m2s_instr,'UniformOutput',0));m2s_outstr=m2s_outstr(1:end-1);end;function varargout = m2s_emptyfn(varargin);throwAsCaller(MException('M2S:FnErr','function called before it has been initialized with $include, $insert or $import'));end;
m2s_file_example();
function m2s_file_example(); m2s.example.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.example.currentline=m2s.example.currentline+1;m2s.example.outstr{m2s.example.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('example file showing include and insert',{});
m2s_write('',{});
% parameters passed from matlab are visible
m2s_write('%s is available',{sp.value});
m2s_write('',{});
if exist( 'sp', 'var' )
m2s_write(' sp is available: %s',{sp.key});
else
m2s_write(' sp is not available',{});
end
m2s_write('',{});
% parameters defined in this script are visible
 test_top=5;
m2s_write('',{});
if exist( 'test_top', 'var' )
m2s_write(' test_top is available: %s',{ test_top });
else
m2s_write(' test_top is not available',{});
end
m2s_write('',{});
m2s_write('',{});
m2s_write('// example.m2s:  top file <<<<<<<<<<<<<<<<<<',{});
m2s_write('',{});
% --------------------- 
% with $include, a separate output file is
% generated for the included file
% and this output file is included with a spice-style .include
m2s_write('// first top include: include/firstInclude.m2s',{});
m2s_file_firstInclude(); m2s_write('.include ''firstInclude.sp''',{});
m2s_write('',{});
m2s_write('// global parameters that are altered inside include/insert files ',{});
m2s_write('// are altered at top level as well',{});
m2s_write('After firstInclude: sp.key = %s',{sp.key});
m2s_write('',{});
m2s_write('',{});
m2s_write('// second top include: include/secondInclude.m2scs',{});
% bug: $include always makes it .include, also when it is a spectre file
% solve with simulator lang:
m2s_write('simulator lang=spice',{});
m2s_file_secondInclude(); m2s_write('.include ''secondInclude.scs''',{});
m2s_write('simulator lang=spectre',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('',{});
% the parameters defined in the included files are not available:
if exist( 'test_include', 'var' )
m2s_write('  test_include is available in top',{});
else
m2s_write('  test_include is not available in top',{});
end
m2s_write('',{});
m2s_write('',{});
% --------------------- 
% with $insert, the content of the inserted file is added to this file.
% The contents is still parsed
m2s_write('// first top insert: include/firstInsert.m2s',{});
m2s_file_firstInsert(); m2s_write(m2s.firstInsert.outstr,{});
m2s_write('',{});
m2s_write('// global parameters that are altered inside include/insert files ',{});
m2s_write('// are altered at top level as well',{});
m2s_write('After firstInsert: sp.key = %s',{sp.key});
m2s_write('',{});
m2s_write('// second top insert: include/firstInsert.m2s',{});
m2s_file_secondInsert(); m2s_write(m2s.secondInsert.outstr,{});
m2s_write('',{});
if exist( 'test_insert', 'var' )
m2s_write('  test_insert is available in top',{});
else
m2s_write('  test_insert is not available in top',{});
end
m2s_write('',{});
m2s_write('// top sp insert',{});
m2s_write('// you can use normal spectre/spice includes, but watch the paths ...',{});
m2s_write('// Either use fully qualified names, or make sure you consider the',{});
m2s_write('// output folder as the starting directory to define relative paths ',{});
m2s_write('',{});
m2s_write('// an insert can solve some issues, but at this moment,',{});
m2s_write('// mat2spice warns when files other then m2s and m2scs files are included.',{});
m2s_write('// What is the desired behaviour?',{});
m2s_file_spiceInclude(); m2s_write(m2s.spiceInclude.outstr,{});
m2s_write('',{});
m2s_write('// example.m2s:  top file >>>>>>>>>>>>>>>>>>>>>>>>',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('',{});
end
function m2s_file_firstInclude(); m2s.firstInclude.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.firstInclude.currentline=m2s.firstInclude.currentline+1;m2s.firstInclude.outstr{m2s.firstInclude.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('// <<<<<<<<<<<<<<<< firstInclude.m2s <<<<<<<<<<<<<<<<<<<<<<<',{});
m2s_write('',{});
% parameters passed from matlab are globally visible
if exist( 'sp', 'var' )
m2s_write(' sp is available: %s in firstInclude',{sp.key});
else
m2s_write(' sp is not available in firstInclude',{});
end
m2s_write('',{});
% parameters defined in this script are visible
 test_include=5;
if exist( 'test_include', 'var' )
m2s_write(' test_include is available: %s',{ test_include });
else
m2s_write(' test_include is not available',{});
end
m2s_write('',{});
m2s_write('',{});
% parameters defined in the parent scope are not visible
if exist( 'test_top', 'var' )
m2s_write(' test_top is available in firstInclude',{});
else
m2s_write(' test_top is not available in firstInclude',{});
end
m2s_write('',{});
m2s_write('// change a globally visible parameter:',{});
 sp.key = 'keyFromFirstInclude';
m2s_write('// this change is applied in the calling m2s file',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('// >>>>>>>>>>>>>>>> firstInclude.m2s >>>>>>>>>>>>>>>>>>>>>>>',{});
end
function m2s_file_firstInsert(); m2s.firstInsert.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.firstInsert.currentline=m2s.firstInsert.currentline+1;m2s.firstInsert.outstr{m2s.firstInsert.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('// <<<<<<<<<<<<<<<< firstInsert.m2s <<<<<<<<<<<<<<<<<<<<<<<',{});
m2s_write('',{});
m2s_write('',{});
% parameters passed from matlab are globally visible
if exist( 'sp', 'var' )
m2s_write(' sp is available: %s in firstInsert',{sp.key});
else
m2s_write(' sp is not available in firstInsert',{});
end
m2s_write('',{});
% parameters defined in this script are visible
 test_insert=5;
if exist( 'test_insert', 'var' )
m2s_write(' test_insert is available: %s',{ test_insert });
else
m2s_write(' test_insert is not available',{});
end
m2s_write('',{});
% parameters defined in the parent scope are not visible
if exist( 'test_top', 'var' )
m2s_write(' test_top is available in firstInsert',{});
else
m2s_write(' test_top is not available in firstInsert',{});
end
m2s_write('',{});
m2s_write('',{});
m2s_write('// change a globally visible parameter:',{});
 sp.key = 'keyFromFirstInsert';
m2s_write('// this change is applied in the calling m2s file',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('// >>>>>>>>>>>>>>>> firstInsert.m2s >>>>>>>>>>>>>>>>>>>>>>>',{});
end
function m2s_file_secondInclude(); m2s.secondInclude.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.secondInclude.currentline=m2s.secondInclude.currentline+1;m2s.secondInclude.outstr{m2s.secondInclude.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('// <<<<<<<<<<<<<<<< secondInclude.m2scs <<<<<<<<<<<<<<<<<<<<<<<',{});
m2s_write('',{});
m2s_write('// include another file from inside an included file',{});
m2s_write('// WARNING: wrong path in generated include/.include statement !!',{});
m2s_file_someFile(); m2s_write('include "someFile.sp"',{});
m2s_write('',{});
m2s_write('// insert another file from inside an included file:',{});
m2s_write(m2s.someFile.outstr,{});
m2s_write('',{});
m2s_write('// >>>>>>>>>>>>>>>> secondInclude.m2scs >>>>>>>>>>>>>>>>>>>>>>>',{});
end
function m2s_file_secondInsert(); m2s.secondInsert.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.secondInsert.currentline=m2s.secondInsert.currentline+1;m2s.secondInsert.outstr{m2s.secondInsert.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('// <<<<<<<<<<<<<<<< secondInsert.m2scs <<<<<<<<<<<<<<<<<<<<<<<',{});
m2s_write('',{});
m2s_write('// include another file from inside an inserted file',{});
m2s_write('// WARNING: wrong path in generated include/.include statement !!',{});
m2s_write('include "someFile.sp"',{});
m2s_write('',{});
m2s_write('// insert another file from inside an inserted file:',{});
m2s_write(m2s.someFile.outstr,{});
m2s_write('',{});
m2s_write('// >>>>>>>>>>>>>>>> secondInsert.m2scs >>>>>>>>>>>>>>>>>>>>>>>',{});
end
function m2s_file_someFile(); m2s.someFile.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.someFile.currentline=m2s.someFile.currentline+1;m2s.someFile.outstr{m2s.someFile.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('// <<< deepInclude/someFile.sp >>>',{});
end
function m2s_file_spiceInclude(); m2s.spiceInclude.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.spiceInclude.currentline=m2s.spiceInclude.currentline+1;m2s.spiceInclude.outstr{m2s.spiceInclude.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('// <<<<<<<<<<<<<<<< spiceInclude.sp <<<<<<<<<<<<<<<<<<<<<<<',{});
m2s_write('',{});
m2s_write('// >>>>>>>>>>>>>>>> spiceInclude.sp >>>>>>>>>>>>>>>>>>>>>>>',{});
end
end