% mat2spice function
%
%  AUTHOR  JDANIELS
%  CREATED 15/09/06
%  REVISED 03/02/10
%
%  v1.0     first version
%  v1.5     included error handling
%  v2.0     several bugfixes and new features such as seperate workspaces
%           for each m2s file, support for matlab functions in m2s-style, 
%           added syntax such as the $var short notation, bus notation,...
%           
% function:
%
%   Converts parametrized spice netlists (.m2s files) to .sp files
%   .m2s files can be written as normal netlists with the extra
%   functionality that you can insert executable matlab-code.
%   Matlab-lines start with a $.
%   Matlab blocks are within ${ }$ 
%   Inline matlab-code can be inserted with $code (without spacings) or
%   $< code >$ (with spacings in the code).
%   To create a bus use busname$[indices]
%
%   For includes, use the reserved keyword $include <netlist> or
%   $insert <netlist>. $include generates a seperate .sp file for the
%   included netlist, while $insert simply inserts the netlist in the
%   caller.
%
%   create m2s-functions with $function, [TODO: add help for functions]
%
% usage: mat2spice(inputfile,outpath[,globalvar1, globalvar2,...])
%
%   inputfile: the top .m2s-file
%   outpath:   the output path for the generated netlist files
%   globalvars:        variables which are visible in the .m2s-files
%
% example .m2s-file:
%
%   $include MOSLIB
%
%   M1 n1 out nss nss N W=$sp.width
%
%   $for I=2:4
%   M$[I] n$[I] out nss nss N W=$<I*sp.width>$
%   $end
%
%
% result:
%
%   .include 'MOSLIB.sp'
%
%   M1 n1 out nss nss N W=1e-6
%
%   M2 n2 out nss nss N W=2e-6
%   M3 n3 out nss nss N W=3e-6
%   M4 n4 out nss nss N W=4e-6
%
%
%

function mat2spice2(inputfile,outpath,varargin)
rndfilename = strjoin({'m2s_run',num2str(randi(1000000))},'');
m2s = struct('m2s',struct);

%default mode=spice
%m2s.m2s.mode = 'spice';
%m2s.m2s.outext = '.sp';

switch nargin
    case 0
        error('no source file given')
    case 1
        error('no target path given')
end


%read global variables
m2s.m2s.globalvars = {};
m2s.m2s.globalvals = {};

for J = 1:length(varargin)
    if ~isempty(inputname(J+2))
        m2s.m2s.globalvars{end+1} = inputname(J+2);
        m2s.m2s.globalvals{end+1} = varargin{J};
    else
        error('M2S:call','Not a valid variable for argument %d',J+2)
    end
end


% main function header
m2s.m2s.headerstr = sprintf([...
  strjoin({'function m2s = ',rndfilename,'(m2s%s%s);'},'')...
    'function m2s_outstr = m2s_arg2str(m2s_instr);'...
       'm2s_outstr = m2s_instr;'... 
       'for m2s_I=1:length(m2s_instr);'...
            'if isnumeric(m2s_instr{m2s_I});'...
                'if length(m2s_instr{m2s_I})>1'...
                   'm2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I},8);'...
                   'm2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);'...
                'else;'...
                   'm2s_outstr{m2s_I} = num2str(m2s_instr{m2s_I},8);'...
                'end;'...
             'elseif islogical(m2s_instr{m2s_I});'...
                'if length(m2s_instr{m2s_I})>1'...
                   'm2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});'...
                   'm2s_outstr{m2s_I} = m2s_outstr{m2s_I}(2:end-1);'...
                'else;'...
                   'm2s_outstr{m2s_I} = mat2str(m2s_instr{m2s_I});'...
                'end;'...
             'end;'...
        'end;'...
    'end;'...
    'function m2s_outstr=m2s_cell2str(m2s_instr);'...
        'm2s_outstr=cell2mat(cellfun(@(m2s_x) [m2s_x sprintf(''\\n'')],m2s_instr,''UniformOutput'',0));'...
        'm2s_outstr=m2s_outstr(1:end-1);'...
    'end;'...
    'function varargout = m2s_emptyfn(varargin);'...
        'throwAsCaller(MException(''M2S:FnErr'',''function called before it has been initialized with $include, $insert or $import''));'...
    'end;'...
],iff(isempty(m2s.m2s.globalvars),'',','),arglist(m2s.m2s.globalvars));

m2s.m2s.footerstr = 'end';

%create structure for top m2s file
outpath = ['./' outpath];

[topfield,infile,outpath,outfile,filetype] = fullpaths('',inputfile,outpath);

m2s.(topfield).infile = infile;
m2s.(topfield).inpath = fileparts(infile);
m2s.(topfield).outfile = outfile;
m2s.(topfield).outpath = outpath;
m2s.(topfield).filetype = filetype;

%collect all included m2s files
collect_inputfiles(topfield);

    function collect_inputfiles(fieldname)
        
        %read file
        disp(sprintf('reading file %s',m2s.(fieldname).infile))
        m2s.(fieldname).infid = fopen(m2s.(fieldname).infile,'r');
        if m2s.(fieldname).infid==-1
            error(['file error: ' m2s.(fieldname).infile])
        end
        
        m2s.(fieldname).instr = textscan(m2s.(fieldname).infid,'%s','delimiter','\n','bufSize',65536,'whitespace','');
        fclose(m2s.(fieldname).infid);
        m2s.(fieldname).instr = m2s.(fieldname).instr{1};
        m2s.(fieldname).fun = sprintf('m2s_file_%s()',fieldname);
        m2s.(fieldname).headerstr = sprintf([...
         'function %s; m2s.%s.currentline = 0;'...
         'function m2s_write(m2s_format,m2s_args);'...
                    'm2s_args=m2s_arg2str(m2s_args);'...
                    'if iscell(m2s_format);'...
                        'm2s_format=m2s_cell2str(m2s_format);'...
                    'end;'...
                    'm2s.%s.currentline=m2s.%s.currentline+1;'...
                    'm2s.%s.outstr{m2s.%s.currentline}=sprintf(m2s_format,m2s_args{:});'...
                    'end;'],m2s.(fieldname).fun,fieldname,fieldname,fieldname,fieldname,fieldname);
        
        m2s.(fieldname).footerstr = 'end';
        
        %scan for occurences of include/insert/import
        expr = regexp(m2s.(fieldname).instr,'^\$(?<mode>include|insert|import)\s+(?<file>\S+)\s*(?<comment>%.*)?$|^\$(?<mode>include|insert|import)\s+(?<file>\S+)\s+(?<path>\S+)\s*(?<comment>%.*)?$','names');
        m2s.(fieldname).ilines = find(~cellfun(@isempty,expr));
        tokens = [expr{m2s.(fieldname).ilines}];
        if isempty(tokens)
            m2s.(fieldname).imodes = {};
            ifiles = {};
            ipaths = {};
        else
            m2s.(fieldname).imodes = {tokens.mode};
            ifiles = {tokens.file};
            ipaths = {tokens.path};
        end
        
        for I = 1:length(m2s.(fieldname).ilines)
            [infield,infile,outpath,outfile,filetype,includestr] = fullpaths(m2s.(fieldname).inpath,ifiles{I},m2s.(fieldname).outpath,ipaths{I},m2s.(fieldname).filetype);
            m2s.(fieldname).ifields{I} = infield;
            if isfield(m2s,infield)
                
                if strcmp(m2s.(fieldname).imodes{I},'include') && ~isempty(m2s.(infield).outfile)
                    warning('file %s included multiple times',ifiles{I})
                end
                
                switch m2s.(fieldname).imodes{I}
                    case 'insert'
                        m2s.(fieldname).runstr{m2s.(fieldname).ilines(I)} = sprintf('m2s_write(m2s.%s.outstr,{});',infield);
                    case 'import'
                        m2s.(fieldname).runstr{m2s.(fieldname).ilines(I)} = sprintf('');
                    case 'include'
                        m2s.(fieldname).runstr{m2s.(fieldname).ilines(I)} = sprintf('m2s_write(''%s'',{});',includestr);
                end
                
            else
                
                m2s.(infield).infile = infile;
                m2s.(infield).inpath = fileparts(infile);
                m2s.(infield).outfile = '';
                m2s.(infield).outpath = '';
                m2s.(infield).filetype = filetype;
                if strcmp(m2s.(fieldname).imodes{I},'include')
                    m2s.(infield).outfile = outfile;
                    m2s.(infield).outpath = outpath;
                end
                collect_inputfiles(infield);
                                
                switch m2s.(fieldname).imodes{I}
                    case 'insert'
                        m2s.(fieldname).runstr{m2s.(fieldname).ilines(I)} = sprintf('%s; m2s_write(m2s.%s.outstr,{});',m2s.(infield).fun,infield);
                    case 'import'
                        m2s.(fieldname).runstr{m2s.(fieldname).ilines(I)} = sprintf('%s;',m2s.(infield).fun);
                    case 'include'
                        m2s.(fieldname).runstr{m2s.(fieldname).ilines(I)} = sprintf('%s; m2s_write(''%s'',{});',m2s.(infield).fun,includestr);
                end
                
            end
            
        end
        
    end

m2s.m2s.runstr{1} = sprintf('%s;',m2s.(topfield).fun);

%scan all files for the occurence of functions
for fieldname = setdiff(fieldnames(m2s)','m2s'),collect_functions(fieldname{:}),end

    function collect_functions(fieldname)
        expr = regexp(m2s.(fieldname).instr,'^\$ *function +(?<foutargs>\[?([\w, ]*?)\]?)?(?<equals> *= *)?(?<funcname>\w+) *(?<finargs>\(.+\))?$','names');
        m2s.(fieldname).flines = find(~cellfun(@isempty,expr));
        for I=1:length(m2s.(fieldname).flines)
            funcname = expr{m2s.(fieldname).flines(I)}.funcname;
            disp(sprintf('loading function %s',funcname))
            m2s.(fieldname).fn.(funcname).inargs =  regexp(expr{m2s.(fieldname).flines(I)}.finargs,'\<\w+\>','match');
            m2s.(fieldname).fn.(funcname).outargs =  regexp(expr{m2s.(fieldname).flines(I)}.foutargs,'\<\w+\>','match');
            
            fnheader = cell(1,8);
            fnheader{1} = sprintf('m2s_write(''$m2s_FN_%s'',{});function ',funcname);
            if isempty(m2s.(fieldname).fn.(funcname).outargs)
                fnheader{2} = sprintf('m2s_FN_%s',funcname);
            else
                fnheader{2} = sprintf('[%s] = m2s_FN_%s',arglist(m2s.(fieldname).fn.(funcname).outargs),funcname);
            end
            if isempty(m2s.(fieldname).fn.(funcname).inargs)
                fnheader{3} = ';';
            else
                fnheader{3} = sprintf('(%s);',arglist(m2s.(fieldname).fn.(funcname).inargs));
            end
            fnheader{4} = sprintf('m2s.%s.fn.%s.currentID=0;',fieldname,funcname);
            fnheader{5} = sprintf([...
                'function ID=m2s_getID;'...
                    'if ~m2s.%s.fn.%s.currentID;'...
                        'm2s.%s.fn.%s.currentID = find(cellfun(@(m2s_x) isequal(m2s_x,{%s}),{m2s.%s.fn.%s.inst.argvals}));'...
                        'if isempty(m2s.%s.fn.%s.currentID);'...
                            'm2s.%s.fn.%s.ID=m2s.%s.fn.%s.ID+1;'...
                            'm2s.%s.fn.%s.currentID=m2s.%s.fn.%s.ID;'...
                            'm2s.%s.fn.%s.inst(m2s.%s.fn.%s.currentID).argvals={%s};'...
                        'end;'...
                        'm2s.%s.fn.%s.inst(m2s.%s.fn.%s.currentID).currentline = 0;'...
                    'end;'...
                    'ID=m2s.%s.fn.%s.currentID;',...
                'end;'],fieldname,funcname,...
                        fieldname,funcname,arglist(m2s.(fieldname).fn.(funcname).inargs),fieldname,funcname,...
                        fieldname,funcname,...
                        fieldname,funcname,fieldname,funcname,...
                        fieldname,funcname,fieldname,funcname,...
                        fieldname,funcname,fieldname,funcname,arglist(m2s.(fieldname).fn.(funcname).inargs),...
                        fieldname,funcname,fieldname,funcname,...
                        fieldname,funcname);
            fnheader{6} = sprintf('function str=m2s_generateInstName;str=sprintf(''%s_%%d'',m2s_getID);end;',funcname);
            fnheader{7} = sprintf('function str=m2s_getParsedText;str=m2s_cell2str(m2s.%s.fn.%s.inst(m2s.%s.fn.%s.currentID).outstr);end;',fieldname,funcname,fieldname,funcname);
            fnheader{8} = sprintf([...
                'function m2s_write(m2s_format,m2s_args);'...
                    'm2s_args=m2s_arg2str(m2s_args);'...
                    'if iscell(m2s_format);'...
                        'm2s_format=m2s_cell2str(m2s_format);'...
                    'end;'...
                    'm2s.%s.fn.%s.inst(m2s_getID).currentline=m2s.%s.fn.%s.inst(m2s_getID).currentline+1;'...
                    'm2s.%s.fn.%s.inst(m2s_getID).outstr{m2s.%s.fn.%s.inst(m2s_getID).currentline}=sprintf(m2s_format,m2s_args{:});'...
                    'end;'],fieldname,funcname,fieldname,funcname,fieldname,funcname,fieldname,funcname);
            m2s.(fieldname).runstr{m2s.(fieldname).flines(I)} = [fnheader{:}];
            
            m2s.m2s.headerstr = [m2s.m2s.headerstr sprintf('%s=@m2s_emptyfn; m2s.%s.fn.%s = struct(''ID'',0,''currentID'',0,''inst'',struct(''outstr'',{},''argvals'',{},''currentline'',0));',funcname,fieldname,funcname)];
            m2s.(fieldname).headerstr = [m2s.(fieldname).headerstr sprintf('%s=@m2s_FN_%s;',funcname,funcname)];
            
        end
        
    end

%scan all files for matlab lines/blocks
for fieldname = setdiff(fieldnames(m2s)','m2s'),collect_mlines(fieldname{:}),end

    function collect_mlines(fieldname)
        
        %block matlab code
        expr = regexp(m2s.(fieldname).instr,'^\${\s*$');
        mblock_start = find(~cellfun(@isempty,expr));
        m2s.(fieldname).instr = regexprep(m2s.(fieldname).instr,'^\${\s*$','');
        expr = regexp(m2s.(fieldname).instr,'^}\$\s*$');
        mblock_end = find(~cellfun(@isempty,expr));
        m2s.(fieldname).instr = regexprep(m2s.(fieldname).instr,'^}\$\s*$','');
        
        if length(mblock_start)>length(mblock_end)
            ME = MException('M2S:ParseErr','<a href="matlab:opentoline(''%s'',1,1)">Error in ==> %s</a>\nMissing "}$"',fullfile(pwd,m2s.(fieldname).infile),m2s.(fieldname).infile);
            throwAsCaller(ME);
        end
        if length(mblock_start)<length(mblock_end)
            ME = MException('M2S:ParseErr','<a href="matlab:opentoline(''%s'',1,1)">Error in ==> %s</a>\nEnding "}$" without a starting "{$"',fullfile(pwd,m2s.(fieldname).infile),m2s.(fieldname).infile);
            throwAsCaller(ME);
        end
        
        mblock_range = [mblock_start,mblock_end]';
        
        if any(mblock_range(2:2:end-1)>mblock_range(3:2:end))
            ME = MException('M2S:ParseErr','<a href="matlab:opentoline(''%s'',1,1)">Error in ==> %s</a>\nStarting "${" before ending "$}"',fullfile(pwd,m2s.(fieldname).infile),m2s.(fieldname).infile);
            throwAsCaller(ME);
        end
        
        if any(mblock_range(1:2:end)>mblock_range(2:2:end))
            ME = MException('M2S:ParseErr','<a href="matlab:opentoline(''%s'',1,1)">Error in ==> %s</a>\nEnding "}$" before starting "{$"',fullfile(pwd,m2s.(fieldname).infile),m2s.(fieldname).infile);
            throwAsCaller(ME);
        end
               
        mblock = [];
        for I = 1:size(mblock_range,2)
            mblock = [mblock mblock_range(2*I-1):mblock_range(2*I)];
        end
        mblock = mblock';
        
        if ~isempty(mblock)
            m2s.(fieldname).runstr(mblock) = m2s.(fieldname).instr(mblock);
        end
        
        
        %empty matlab line
        expr = regexp(m2s.(fieldname).instr,'^\$$');
        mlines1 = setdiff(find(~cellfun(@isempty,expr)),[m2s.(fieldname).flines;m2s.(fieldname).ilines; mblock]);
        if ~isempty(mlines1)
            [m2s.(fieldname).runstr{mlines1}] = deal([]);
        end
               
        %one line matlab code
        expr = regexp(m2s.(fieldname).instr,'^\$([^<{\$].*)$','tokens');
        mlines2 = setdiff(find(~cellfun(@isempty,expr)),[m2s.(fieldname).flines;m2s.(fieldname).ilines; mblock]);
        if ~isempty(mlines2)
            tokens = [expr{mlines2}];
            m2s.(fieldname).runstr(mlines2) = [tokens{:}];
        end
                      
        m2s.(fieldname).mlines = union(mlines1,union(mlines2,mblock));
        
        
        
    end

%scan all files for spice lines 
for fieldname = setdiff(fieldnames(m2s)','m2s'),collect_slines(fieldname{:}),end

    function collect_slines(fieldname)
               
        m2s.(fieldname).slines = setdiff(1:length(m2s.(fieldname).instr),[m2s.(fieldname).flines;m2s.(fieldname).ilines;m2s.(fieldname).mlines]);
        instr = m2s.(fieldname).instr(m2s.(fieldname).slines);
        instr = regexprep(instr,'\$\$','\$<char(36)>\$');
               
        expr = regexp(instr,'\<(?<busname>\S+)\>\$(?<busargs>(\[([^\[\]\$]|\[([^\[\]\$])*\])+\])+)','names');
        blines = find(~cellfun(@isempty,expr));
        for bline = blines'
            expri = expr{bline};
            busnames = {expri.busname};
            busargs = {expri.busargs};
            busargs = regexp(busargs,'\[([^\[\]\$]|\[([^\[\]\$])*\])+\]','match');
            buscall = cellfun(@(x,y) sprintf('$<bus(''%s'',%s)>$',x,arglist(y)),busnames,busargs,'UniformOutput',0);
            for busi = 1:length(buscall)
                instr(bline) = regexprep(instr(bline),'\<\S+\>\$(\[([^\[\]\$]|\[([^\[\]\$])*\])+\])+',buscall{busi},'once');
            end
        end
                
        exprstr = '\$<(.+?)>\$|\$([^\s<][^\s\$]*)';
        expr = regexp(instr,exprstr,'tokens');
        instr = strrep(instr,'\','\\');
        instr = strrep(instr,'%','%%');
        instr = strrep(instr,'''','''''');
        tokens = {};
        for expri = expr'
            tokens{end+1,1} = unpackcell(expri{1});
        end
                       
        instr = regexprep(instr,exprstr,'%s');
        for sline_i = 1:length(m2s.(fieldname).slines)
            m2s.(fieldname).runstr{m2s.(fieldname).slines(sline_i)} = sprintf('m2s_write(''%s'',%s);',instr{sline_i},['{' arglist(tokens{sline_i}) '}']);
        end    
    end

%build functions for writing output

m2s = orderfields(m2s);

runstr{1} = m2s.m2s.headerstr;
runstr{end+1} = cell2str(m2s.m2s.runstr);

dbcurrentline = 3;

for fieldname = setdiff(fieldnames(m2s)','m2s')
    dbline.(fieldname{1}) = dbcurrentline;
    runstr{end+1} = m2s.(fieldname{1}).headerstr;
    runstr{end+1} = cell2str(m2s.(fieldname{1}).runstr);
    runstr{end+1} = m2s.(fieldname{1}).footerstr;
    dbcurrentline = dbcurrentline + length(m2s.(fieldname{1}).runstr) + 2;
end
runstr{end+1} = m2s.m2s.footerstr;

runstr = cell2str(runstr);

%write functions to m-file

frunid = fopen(strjoin({rndfilename,'.m'},''),'w');
fwrite(frunid,runstr);
fclose(frunid);

%execute m-file
[ignore,runfn] = fileparts(strjoin({rndfilename,'.m'},''));

rehash
clear('FUN',runfn)

try
    m2s = feval(runfn,m2s,m2s.m2s.globalvals{:});
catch ME
    lowermsg = sprintf([ME.message '\n']);
    %get error line in run file
    file_error = ~isempty(regexp(ME.message,'^Error: <.+?>File:', 'once'));
    
    ME
    ME.message
    
    if file_error
        lowermsg = [lowermsg sprintf('\nError in ==> <a href="matlab:opentoline(''%s'',%d)">%s at %d</a>\n',ME.stack(1).file,ME.stack(1).line,ME.stack(1).name,ME.stack(1).line)];
        errline = regexp(ME.message,'Line: (\d+)','tokens');
        errline = str2num(errline{1}{1});
        dbdiff = structfun(@(x) iff(errline-x<0,inf,errline-x),dbline);
        [errline,idx] = min(dbdiff);
        if ~isinf(errline)
            dbfieldnames = fieldnames(dbline);
            errfieldname = dbfieldnames{idx};
            if errline > length(m2s.(errfieldname).instr)
                if strcmp(ME.identifier,'MATLAB:m_mixed_closed_and_open_function_defs')
                    lowermsg = [lowermsg sprintf('\n    Probable cause: END missing after $function\n')];
                elseif strcmp(ME.identifier,'MATLAB:m_statement_not_in_a_function')
                    lowermsg = [lowermsg sprintf('\n    Probable cause: unexpected END in source file\n')];
                else
                    lowermsg = [lowermsg sprintf('\n    Probable cause: unknown\n')];
                end
            else
                 lowermsg = [lowermsg sprintf('\nError in ==> <a href="matlab:opentoline(''%s'',%d)">%s at %d</a>\n%s\n',fullfile(pwd,m2s.(errfieldname).infile),errline,m2s.(errfieldname).infile,m2s.(errfieldname).instr{errline})];
            end
        end
    end   
    
    for istack=1:length(ME.stack)-1
        if  istack ~=1 && strcmp(ME.stack(istack).name,rndfilename)
            continue
        end
        if  istack ~=1 && strcmp(ME.stack(istack).name,'mat2spice')
            continue
        end
        errfieldname = regexp(ME.stack(istack).name,strjoin({'^',rndfilename,'/m2s_file_(\w+)'},''),'tokens');
        if ~isempty(errfieldname)
            errfieldname = errfieldname{1}{1};
            errline = ME.stack(istack).line;
            errline = errline - dbline.(errfieldname);
            if errline == 0
                lowermsg = [lowermsg sprintf('\nError in ==> <a href="matlab:opentoline(''%s'',%d)">%s at %d</a>\n',ME.stack(istack).file,ME.stack(istack).line,ME.stack(istack).name,ME.stack(istack).line)];
            else
                lowermsg = [lowermsg sprintf('\nError in ==> <a href="matlab:opentoline(''%s'',%d)">%s at %d</a> (<a href="matlab:opentoline(''%s'',%d)">%s at %d</a>)\n%s\n',fullfile(pwd,m2s.(errfieldname).infile),errline,m2s.(errfieldname).infile,errline,ME.stack(istack).file,ME.stack(istack).line,ME.stack(istack).name,ME.stack(istack).line,m2s.(errfieldname).instr{errline})];
            end
        else
            lowermsg = [lowermsg sprintf('\nError in ==> <a href="matlab:opentoline(''%s'',%d)">%s at %d</a>\n',ME.stack(istack).file,ME.stack(istack).line,ME.stack(istack).name,ME.stack(istack).line)];
        end
    end
    
    
    %rethrow error
    
    new_ME = MException('M2S:ParseErr',lowermsg);
    throwAsCaller(new_ME);
    
end

%write parsed text to output files

for fieldname = setdiff(fieldnames(m2s)','m2s')
    if ~isempty(m2s.(fieldname{1}).outfile)
        if ~exist(m2s.(fieldname{1}).outpath,'dir')
            mkdir(m2s.(fieldname{1}).outpath);
        end
        disp(sprintf('writing file %s',m2s.(fieldname{1}).outfile))
        m2s.(fieldname{1}).outfid = fopen(m2s.(fieldname{1}).outfile,'w');
        if m2s.(fieldname{1}).outfid == -1
            error('unable to write file %s',m2s.(fieldname{1}).outfile);
        end
        
        if isfield(m2s.(fieldname{1}),'fn')
            for funcname = fieldnames(m2s.(fieldname{1}).fn)'
                m2s.(fieldname{1}).outstr=regexprep(m2s.(fieldname{1}).outstr,['^\$m2s_FN_' funcname{1}],cell2str([m2s.(fieldname{1}).fn.(funcname{1}).inst.outstr]));
            end
        end
        
        fwrite(m2s.(fieldname{1}).outfid,cell2str(m2s.(fieldname{1}).outstr));
        fclose(m2s.(fieldname{1}).outfid);
    end
end

system(strjoin({'rm -rf ',rndfilename,'.m'},''));

return

end


function fieldname = file2field(filename)
fieldname = genvarname(filename);
end

%function filename = field2file(fieldname)
%filename = regexprep(fieldname,'0x([0-9A-F]{2})','${char(hex2dec($1))}');
%end

function str = arglist(args)
args(2,:) = {','};
str = [args{1:end-1}];
end

function y=unpackcell(x)

if isempty(x) || ~iscell(x)
    y = {};
else
    y = [x{:}];
end

end

function outstr=cell2str(instr)
outstr = '';
for instri=instr
    outstr = [outstr instri{1} sprintf('\n')];
end
outstr = outstr(1:end-1);
end

function result = iff(condition,trueResult,falseResult)
error(nargchk(3,3,nargin));
if length(condition) == 1
    if condition
        result = trueResult;
    else
        result = falseResult;
    end
elseif islogical(condition)
    result(condition) = trueResult(condition);
    result(~condition) = falseResult(~condition);
else
    error('condition must have logical values')
end
end

function [inputfield,inputfile,outputpath,outputfile, outputfiletype, includestr] = fullpaths(inpath,infile,absoutputpath,reloutputpath,sourcefiletype)

infile = fullfile(inpath,infile);

[inputpath, inputname, inputext] = fileparts(infile);

if isempty(inputext) 
    inputext = '.m2s';
    outext = '.sp';
elseif strcmp(inputext,'.m2s') 
    outext = '.sp';
elseif ~strcmp(inputext(1:3),'.m2')
    %infile
    %error('wrong type of input file, extension must start with .m2')
    fprintf('WARNING: wrong type of input file, extension should start with .m2\n == File = "%s"',infile);
    outext = inputext
else
    outext = ['.' inputext(4:end)];
end

if nargin == 3
    outputpath = absoutputpath;
elseif isempty(reloutputpath)
    outputpath = fullfile(absoutputpath,inpath,'');
else
    outputpath = fullfile(absoutputpath,reloutputpath,'');
end

inputfield = file2field(inputname);
inputfile = fullfile(inputpath, [inputname inputext]);
outputfile = fullfile(outputpath, [inputname outext]);

switch outext
    case {'.sp','.tit','.cir'}
        outputfiletype = 'spice';
    case '.scs'
        outputfiletype = 'spectre';
    case '.mdl'
        outputfiletype = 'mdl';
    case '.vec'
        outputfiletype = 'vec';
    otherwise
        outputfiletype = 'unknown';
end

if nargin < 5
    return
end

includefile = fullfile(reloutputpath, [inputname outext]);

switch sourcefiletype
    case 'spectre'
        includestr = sprintf('include "%s"',includefile);
    otherwise
        if strcmp(outputfiletype,'vec')
            includestr = sprintf('.vec ''''%s''''',includefile);
        else
            includestr = sprintf('.include ''''%s''''',includefile);
        end
end

end
