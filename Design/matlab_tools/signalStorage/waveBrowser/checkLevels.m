function checkLevels(sims,tree,timeStep,rules)

if nargin <4
   rules.Vhigh = 0.9;
   rules.Vlow = 0.1;
   rules.pass = 0;
   
   avoidGates = '.*rg';
   avoidTrans = '.*[.][Mm].*';
   avoidLogicFloatNodes = '.*n\d+';
   avoidAllowedFloatingNodes ='.*Float.*';
   
   rules.NOWARN{1} = avoidGates;
   rules.NOWARN{2} = avoidTrans;
   rules.NOWARN{3} = avoidLogicFloatNodes;
   rules.NOWARN{4} = avoidAllowedFloatingNodes;
end
if(isstruct(tree))
    FN = fieldnames(tree);
    for i=1:length(FN)
        subtree = tree.(FN{i});
        if(~strcmp(FN{i},'zPATH'))
            checkLevels(sims,subtree,timeStep);
        end
    end
else
    if ~sims.isSignalAvailable(tree)
        sims.load(tree);
    end
    if sims.isSignalAvailable(tree)
    signal = sims.getSignal(tree);
   if strcmp(signal.getYUnit(),'V')
       SVal = signal.getValueAt(timeStep);
     %  disp(signal.getYName)
       if(SVal > rules.Vlow && SVal < rules.Vhigh && ~rules.pass )
           if( noWarnExeption(tree,rules.NOWARN) )
            warning('MATLAB:wrongSim','%s is at %g for timestep %s',tree,SVal,timeStep);
           end
       end
   end
    end
   sims.removeAllSignals    
end

    function noWarn = noWarnExeption(signame , RuleSet )
       noWarn = 1;
       for j=1:length(RuleSet)
           Reg = RuleSet{j};
           noWarn = noWarn & isempty(regexp(signame , Reg, 'once')) ;
       end
    end

end