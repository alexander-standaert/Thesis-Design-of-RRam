function progress_bar(t,flag)
  persistent PB;

  if nargin == 1
    flag = '';
  end

  switch flag
    case 'init'
      PB.barlength = 50;
      PB.start = clock;
      PB.tprogress = 0;
      PB.oldprogress = 0;
      PB.n_to_erase = 0;
      PB.tend = t;
    case 'done'
      outstr = ['[' repmat('#',1,PB.barlength) '] ' '100 %% completed\n\n'];
      fprintf(1,repmat('\b',1,PB.n_to_erase));
      fprintf(1,outstr);
    otherwise
      PB.now = clock;
      PB.delta = etime(PB.now,PB.start);
      if PB.delta > 1
        PB.start = PB.now;
        PB.tprogress = PB.tprogress + PB.delta;
        PB.progress = 100*t/PB.tend;
        if PB.progress - PB.oldprogress >= 1
          PB.oldprogress = PB.progress;
          PB.estimated = (100-PB.progress)*(PB.tprogress/PB.progress);
          PB.bar = round(PB.progress*PB.barlength/100);
          PB.T = floor(mod(PB.estimated,[86400,3600,60])./[3600,60,1]);
          outstr = ['[' repmat('#',1,PB.bar) repmat('.',1,PB.barlength-PB.bar) '] '...
          num2str(round(PB.progress)) '%% completed ('...
          num2str(PB.T(1)) 'h ' num2str(PB.T(2)) 'm ' num2str(PB.T(3)) 's left)'];
          fprintf(1,repmat('\b',1,PB.n_to_erase));
          fprintf(1,outstr);
          PB.n_to_erase = length(outstr)-1;
        end
      end
  end
end 
