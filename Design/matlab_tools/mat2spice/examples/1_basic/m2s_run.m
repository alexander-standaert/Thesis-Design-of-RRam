function m2s = m2s_run(m2s);function m2s_outstr = m2s_arg2str(m2s_instr);m2s_outstr = m2s_instr;for m2s_I=1:length(m2s_instr);if isnumeric(m2s_instr{m2s_I});if length(m2s_instr{m2s_I})>1m2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);m2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);else;m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);end;elseif islogical(m2s_instr{m2s_I});m2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I});end;end;end;function m2s_outstr=m2s_cell2str(m2s_instr);m2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf('\n')],m2s_instr,'UniformOutput',0));m2s_outstr=m2s_outstr(1:end-1);end;function varargout = m2s_emptyfn(varargin);throwAsCaller(MException('M2S:FnErr','function called before it has been initialized with $include, $insert or $import'));end;
m2s_file_example();
function m2s_file_example(); m2s.example.currentline = 0;function m2s_write(m2s_format,m2s_args);m2s_args=m2s_arg2str(m2s_args);if iscell(m2s_format);m2s_format=m2s_cell2str(m2s_format);end;m2s.example.currentline=m2s.example.currentline+1;m2s.example.outstr{m2s.example.currentline}=sprintf(m2s_format,m2s_args{:});end;
m2s_write('example file showing basic usage of mat2spice',{});
m2s_write('',{});
m2s_write('//  this is spectre comment, it is copied verbatim to the generated file',{});
m2s_write('',{});
m2s_write('',{});
% Lines that start with a $ are interpreted as matlab code
% A matlab line that starts with % is a comment
% Matlab comment is not copied to the generated file
% You have to use matlab comments when comments contain mat2spice code
% that should not be evaluated
m2s_write('',{});
 text = sprintf( 'this string will shows in the matlab console (%d)\n', 5 );
 fprintf( text );
% fprintf prints to the console during generation of the netlist
% not to the output netlist
m2s_write('',{});
% block matlab commands can be inserted as well:

a=5;
b=3;
c=a*b 

m2s_write('',{});
m2s_write('',{});
% When you use $<matlab code>$, the string derived from the matlab code
% is inserted in line with the rest of the text.
% This works both when (matlab code) is numerical, but also
% when it is a string
m2s_write('',{});
N=25;
m2s_write('this is N: %s.  Isn''t that cute?',{ N });
m2s_write('',{});
m2s_write('==>%s.',{ sprintf('N=%g\n', 35.2) });
m2s_write('next line',{});
m2s_write('',{});
m2s_write('test ',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('',{});
%  $expression is a shorthand for inserting the result of matlab code.
%  It only works when the matlab expression does not contain spaces and is
%  followed by a space
m2s_write('shorthand notation: "%s "',{25*3});
m2s_write('',{});
m2s_write('',{});
m2s_write('',{});
m2s_write('//  you can do all things you can do in matlab, e.g. looping:',{});
 for i=[ 10 20 ]
   for j=1:3
m2s_write('this is index %s,%s ',{i,j});
m2s_write('Xcell_%s_%s ( bl_%s wl_%s vdd vss ) SOLAR_CELL',{i,j,i,j});
   end
 end
m2s_write('',{});
m2s_write('',{});
m2s_write('//  you can call any matlab function:',{});
m2s_write('this is the result of calling myFunction(5): %s',{myFunction(5)});
m2s_write('',{});
m2s_write('',{});
m2s_write('//  some popular functions:',{});
m2s_write('//  -- the bus function:',{});
m2s_write('//  NOTE: if you use a bus function to write a signal at one place in a',{});
m2s_write('//        subcircuit, use it all places in the subcircuit!',{});
m2s_write('//        don''t combine %s with a%s or a_%s !!',{bus('a', 0:7),i,i});
m2s_write('this is a bus: %s',{ bus( 'a', [ 0 1 10 ] ) });
m2s_write('',{});
m2s_write('',{});
m2s_write('//  special bus function notation:',{});
% name$[vector] is equivalent to $< bus( 'name', vector ) >$
m2s_write('%s',{bus('a',[5:10])});
m2s_write('%s',{bus('atest',[ 2 3 ])});
end
end