function [ jobId ] = addBatchJob( map, name, shellCommands )
%% This function adds the given shell batch jobs to the provided map,
%% in the {map}/todo/ directory
%%
%%  (normally, map should be '~/utils/matlabParallel')
%% 
%% These batch jobs can then be executed in parallel on different computers
%% by running the performJobsContiniously.sh-script in {map} (remains
%% running (in a slow polling loop) even when no jobs are available.
%% or by running performJobs.sh (stops as soon as no jobs are available)
%%
%% You can use batchJobsDone( map, names ) to check wether all the
%% jobs in names have been performed
%%
%% shellCommands is a cell array containing the different lines of the
%% shell script
%% e.g. cd myBanana  \nspectre... \nremoveDummyData\n
%% you should not use the variable 'startpath' in the shellCommands
%%
%%  jobId is a structure 'uniquely' identifiying this job
%%  jobId.baseMap, jobId.name
%%
%%  sometimes a program fails due to an unexpected reason, for example
%%  a user interrupt or a spectre-I-don't-like-this-machine kind of stuff.
%%  If the bash variable ${interrupted} is set in the shellCommands to 
%%  anything but the empty string (set it too "true"), we move the 
%%  batchJob back to todo...
%%  

t=now;

seconds=floor( t*24*3600 );
milliseconds=seconds * 1000;

jobId.baseMap  = map;
jobId.name     = sprintf( 'job_%s_%.0f.sh', name, milliseconds );

[SUCCESS,MESSAGE,MESSAGEID] = mkdir( jobId.baseMap );
[SUCCESS,MESSAGE,MESSAGEID] = mkdir( jobId.baseMap, 'todo' );
[SUCCESS,MESSAGE,MESSAGEID] = mkdir( jobId.baseMap, 'buzy' );
[SUCCESS,MESSAGE,MESSAGEID] = mkdir( jobId.baseMap, 'done' );

todo_file = sprintf( '%s/todo/%s', jobId.baseMap, jobId.name );
todo_fid = fopen( todo_file, 'w' );


%%check wether this file has not allready been moved (this is probably
%%better than no check, but worse
fprintf( todo_fid, 'X=`ls todo/%s 2> outx` \n', jobId.name );
fprintf( todo_fid, 'if [ ! -z "$X" ]; then \n'       );
fprintf( todo_fid, '  mv todo/%s buzy/%s \n', jobId.name, jobId.name );
fprintf( todo_fid, '  startpath=${PWD}         \n' );


fprintf( todo_fid, '  \n' );
for i=1:length(shellCommands)
    fprintf( todo_fid, '  %s\n', shellCommands{i} );
end
fprintf( todo_fid, '  \n' );

fprintf( todo_fid, '  cd ${startpath}          \n' ); 
fprintf( todo_fid, '  if [ -z "$interrupted" ]; then \n' );
fprintf( todo_fid, '    mv buzy/%s done/%s \n', jobId.name, jobId.name );
fprintf( todo_fid, '  else \n' );
fprintf( todo_fid, '    echo "interrupted=${interrupted}" \n' );
fprintf( todo_fid, '    mv buzy/%s todo/%s \n', jobId.name, jobId.name );
fprintf( todo_fid, '    echo "execution of %s was interrupted" \n', jobId.name );
fprintf( todo_fid, '  fi  \n' );
fprintf( todo_fid, 'else \n'       );
fprintf( todo_fid, '  echo "todo/%s allready started elsewhere"  \n', jobId.name );
fprintf( todo_fid, 'fi \n'       );

fclose( todo_fid );