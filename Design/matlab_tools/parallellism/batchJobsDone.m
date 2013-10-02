function [allDone, jobsDone, jobsBuzy, jobsTodo, jobsLost] = batchJobsDone( jobIds )
%% check wether all jobs in jobIds have been completed
%%
%% allDone==1 if all jobs are in the done-folder
%% allDone==0 if not all jobs are in the done
%%
%% the other return values are cell arrays containing:
%% jobsDone:  all jobs that have been copied to the done folder
%% jobsBuzy:  all jobs that are in the buzy folder
%% jobsTodo:  all jobs that are still in the todo folder
%% jobsLost:  all jobs that have disappeared...
%%
%% it is assumed that is impossible to end up with two copies of a job...

allDone=1;

idone=1;
ibuzy=1;
itodo=1;
ilost=1;

jobsDone = cell(0,1);
jobsBuzy = cell(0,1);
jobsTodo = cell(0,1);
jobsLost = cell(0,1);

if length(jobIds)>=1
    jobId = jobIds{1};
    fullDoneLS = sprintf( '!ls %s/done/ >doneStatus', jobId.baseMap );
    fullBuzyLS = sprintf( '!ls %s/buzy/ >buzyStatus', jobId.baseMap );
    fullTodoLS = sprintf( '!ls %s/todo/ >todoStatus', jobId.baseMap );
    eval( fullDoneLS );
    eval( fullBuzyLS );
    eval( fullTodoLS );
end


for i=1:length(jobIds)

    jobId = jobIds{i};
    
    fullDoneName = sprintf( '%s/done/%s', jobId.baseMap, jobId.name );
    fullBuzyName = sprintf( '%s/buzy/%s', jobId.baseMap, jobId.name );
    fullTodoName = sprintf( '%s/todo/%s', jobId.baseMap, jobId.name );
    
    if( exist( fullTodoName ) ) 
        allDone = 0;
        jobsTodo{ itodo } = jobId;
        itodo = itodo+1;
    else        
        if( exist( fullBuzyName ) ) 
            allDone = 0;
            jobsBuzy{ ibuzy } = jobId;
            ibuzy = ibuzy+1;
        else
            if( exist( fullDoneName ) ) 
                jobsDone{ idone } = jobId;
                idone = idone+1;
            else            
                allDone=0;
                jobsLost{ ilost } = jobId;
                ilost = ilost+1;
            end
        end        
    end   
end