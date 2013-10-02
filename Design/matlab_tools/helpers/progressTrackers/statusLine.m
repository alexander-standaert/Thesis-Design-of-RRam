function statusLine( text, firstTime )
%%  function statusLine( text, flag )
%%  text is the text to write on the line 
%%  if firstTime==1, no previous data is removed
%%  otherwise, the previously written number of characters is removed

  persistent PB;
  
  if firstTime==1
    PB.n_to_erase=0;
  else
    fprintf(1,repmat('\b',1,PB.n_to_erase));
  end

  PB.n_to_erase = length(text);
  fprintf(1, text );

