function m2s = m2s_run(m2s,sp);function m2s_outstr = m2s_arg2str(m2s_instr);m2s_outstr = m2s_instr;for m2s_I=1:length(m2s_instr);if isnumeric(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);end;elseif islogical(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});end;end;end;end;function m2s_outstr=m2s_cell2str(m2s_instr);m2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf('\n')],m2s_instr,'UniformOutput',0));m2s_outstr=m2s_outstr(1:end-1);end;function varargout = m2s_emptyfn(varargin);throwAsCaller(MException('M2S:FnErr','function called before it has been initialized with $include, $insert or $import'));end;CHAIN=@m2s_emptyfn; m2s.inline.fn.CHAIN = struct('ID',0,'currentID',0,'inst',struct('outstr',{},'argvals',{},'currentline',0));DUMMY=@m2s_emptyfn; m2s.inline.fn.DUMMY = struct('ID',0,'currentID',0,'inst',struct('outstr',{},'argvals',{},'currentline',0));
m2s_file_inline();
function m2s_file_inline(); m2s.inline.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.inline.currentline=m2s.inline.currentline+1;m2s.inline.outstr{m2s.inline.currentline}=sprintf(m2s_format,m2s_args{:});end;CHAIN=@m2s_FN_CHAIN;DUMMY=@m2s_FN_DUMMY;
m2s_write('// example file to show use of functions in the main code body of a m2s file',{});
m2s_write('//',{});
m2s_write('// author: Stefan Cosemans',{});
m2s_write('// last modification: 2010-06-30',{});
m2s_write('',{});
m2s_write('// functions are used to create subcircuits with parameters,',{});
m2s_write('// e.g. the number of inverters in a chain.',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('// CHAIN functions {{{1',{});
m2s_write('// ==============================================',{});
m2s_write('// ==============================================',{});
m2s_write('$m2s_FN_CHAIN',{});function [sname] = m2s_FN_CHAIN(chainLength);m2s.inline.fn.CHAIN.currentID=0;function ID=m2s_getID;if ~m2s.inline.fn.CHAIN.currentID;m2s.inline.fn.CHAIN.currentID = find(cellfun(@(m2s_x) isequal(m2s_x,{chainLength}),{m2s.inline.fn.CHAIN.inst.argvals}));if isempty(m2s.inline.fn.CHAIN.currentID);m2s.inline.fn.CHAIN.ID=m2s.inline.fn.CHAIN.ID+1;m2s.inline.fn.CHAIN.currentID=m2s.inline.fn.CHAIN.ID;m2s.inline.fn.CHAIN.inst(m2s.inline.fn.CHAIN.currentID).argvals={chainLength};end;m2s.inline.fn.CHAIN.inst(m2s.inline.fn.CHAIN.currentID).currentline = 0;end;ID=m2s.inline.fn.CHAIN.currentID;end;function str=m2s_generateInstName;str=sprintf('CHAIN_%d',m2s_getID);end;function str=m2s_getParsedText;str=m2s_cell2str(m2s.inline.fn.CHAIN.inst(m2s.inline.fn.CHAIN.currentID).outstr);end;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.inline.fn.CHAIN.inst(m2s_getID).currentline=m2s.inline.fn.CHAIN.inst(m2s_getID).currentline+1;m2s.inline.fn.CHAIN.inst(m2s_getID).outstr{m2s.inline.fn.CHAIN.inst(m2s_getID).currentline}=sprintf(m2s_format,m2s_args{:});end;

%CHAIN generates a chain of INVERTERs of length chainLength
sname = m2s_generateInstName;

m2s_write('',{});
m2s_write('// CHAIN chainLength=%s {{{2',{chainLength});
m2s_write('// ==============================================',{});
m2s_write('subckt %s ( vdd vss in out )',{sname});
m2s_write('parameters S=0 R=2',{});
m2s_write('',{});
m2s_write('connect in n0',{});
 for i=0:(chainLength-1)
m2s_write('Xinv_%s ( vdd vss n%s n%s )',{i,i,i+1});
 end
m2s_write('connect out n%s ',{chainLength});
m2s_write('',{});
m2s_write('ends',{});
m2s_write('// }}}2',{});
m2s_write('',{});
end  % function
m2s_write('// ==============================================',{});
m2s_write('// ==============================================',{});
m2s_write('// }}}1',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('// DUMMY functions {{{1',{});
m2s_write('// ==============================================',{});
m2s_write('// ==============================================',{});
m2s_write('// you can use structures etc as input arguments for subcircuit functions',{});
m2s_write('$m2s_FN_DUMMY',{});function [sname] = m2s_FN_DUMMY(comment);m2s.inline.fn.DUMMY.currentID=0;function ID=m2s_getID;if ~m2s.inline.fn.DUMMY.currentID;m2s.inline.fn.DUMMY.currentID = find(cellfun(@(m2s_x) isequal(m2s_x,{comment}),{m2s.inline.fn.DUMMY.inst.argvals}));if isempty(m2s.inline.fn.DUMMY.currentID);m2s.inline.fn.DUMMY.ID=m2s.inline.fn.DUMMY.ID+1;m2s.inline.fn.DUMMY.currentID=m2s.inline.fn.DUMMY.ID;m2s.inline.fn.DUMMY.inst(m2s.inline.fn.DUMMY.currentID).argvals={comment};end;m2s.inline.fn.DUMMY.inst(m2s.inline.fn.DUMMY.currentID).currentline = 0;end;ID=m2s.inline.fn.DUMMY.currentID;end;function str=m2s_generateInstName;str=sprintf('DUMMY_%d',m2s_getID);end;function str=m2s_getParsedText;str=m2s_cell2str(m2s.inline.fn.DUMMY.inst(m2s.inline.fn.DUMMY.currentID).outstr);end;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.inline.fn.DUMMY.inst(m2s_getID).currentline=m2s.inline.fn.DUMMY.inst(m2s_getID).currentline+1;m2s.inline.fn.DUMMY.inst(m2s_getID).outstr{m2s.inline.fn.DUMMY.inst(m2s_getID).currentline}=sprintf(m2s_format,m2s_args{:});end;
 sname = m2s_generateInstName;
m2s_write('',{});
m2s_write('subckt %s ( in out )',{sname});
m2s_write('',{});
m2s_write('// commentName  = %s',{comment.name });
m2s_write('// commentValue = %s',{comment.value});
m2s_write('',{});
m2s_write('// you can instantiate another function subcircuit inside a function:',{});
m2s_write('Xchain ( vdd vss in out ) %s',{ CHAIN( comment.value ) });
m2s_write('',{});
m2s_write('ends',{});
m2s_write('',{});
end  % function
m2s_write('// }}}1',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('// instantiations {{{1',{});
m2s_write('// ==============================================',{});
m2s_write('',{});
m2s_write('Xchain_test ( vdd vss in1 out1 ) %s S=5',{ CHAIN( 5 ) });
m2s_write('',{});
for i=1:10  
m2s_write('Xchain_%s ( vdd vss in%s out%s ) %s S=5 R=3',{i,i,i, CHAIN( i ) });
end
% notice: i here is not affected by i inside CHAIN, as it should be
% BUG: each time the function is called, it starts with the
% variables as defined at the position it is last called.  
% Don't use this behaviour !! Be careful with global variables whose
% values are changed inside the m2s files
m2s_write('',{});
m2s_write('Xchain_test ( vdd vss in1 out1 ) %s S=5',{ CHAIN( 5 ) });
m2s_write('',{});

 comment_1.name='first comment';
 comment_1.value=55;
 comment_2.name='second comment';
 comment_2.value=55;

m2s_write('Xcomment_1 ( A1 B1 ) %s',{ DUMMY( comment_1 ) });
m2s_write('Xcomment_2 ( A2 B2 ) %s',{ DUMMY( comment_2 ) });
m2s_write('',{});
m2s_write('// }}}1',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('',{});
end
end