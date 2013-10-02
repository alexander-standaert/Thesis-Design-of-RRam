function [] = waitUntilAllJobsDone( jobIds )
%%  waitUntilAllJobsDone( jobIds )
%%
%%  this function does not return until all jobs in jobIds have been
%%  completed.  It displays a statusmessage on the screen during the wait
%%  time
%%
%%  also, if all jobs are done or buzy, and the jobs remain too long in the
%%  buzy-cue, we move them back to the buzy cue

allDone=0;
first=1;

waitingForLastBuzies=0;

while allDone==0 && length(jobIds)>0
    [allDone, jobsDone, jobsBuzy, jobsTodo, jobsLost] = batchJobsDone( jobIds );
    progress = length( jobsDone ) / length( jobIds ) * 100;
    status = sprintf('progress (%3.2f):  jobsDone(%d), jobsBuzy(%d), jobsTodo(%d), jobsLost(%d)', ...
        progress, length(jobsDone), length(jobsBuzy), length(jobsTodo), length(jobsLost)  );
    statusLine( status, first ) ;
    first=0;

    if allDone==0
        pause(2);
    end
    
    if( length(jobsTodo)==0 && length(jobsBuzy)>0 )
        waitingForLastBuzies=waitingForLastBuzies+1;
        if( waitingForLastBuzies>5 ) %%10 seconds
            fprintf(1, 'It appears some jobs are taking too long ... rescheduling them\n' );
            for i=1:length( jobsBuzy )
                jobId = jobsBuzy{i};
                mvCommand = sprintf( '!mv %s/buzy/%s %s/todo/%s', jobId.baseMap, jobId.name, ...
                                                                  jobId.baseMap, jobId.name );
                eval(mvCommand);
                fprintf(1, 'rescheduled job %s\n', jobId.name );
            end
            first=1;
        end
    else
        waitingForLastBuzies=0;
    end
end

%%now, clean up all jobs from the done-list
for i=1:length(jobsDone)
   jobId = jobsDone{i};
   rmCommand = sprintf('!rm %s/done/%s',  jobId.baseMap, jobId.name );
end
status = sprintf('\n');