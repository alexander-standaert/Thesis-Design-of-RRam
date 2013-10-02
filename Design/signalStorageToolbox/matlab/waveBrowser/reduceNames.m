function reduceNames( axis )
if nargin < 1
    axis = gca; 
end
Childs = get(axis,'Child');

for i=1:length(Childs)
    Str = get(Childs(i),'DisplayName');
  Istart = regexp(Str,'\.[^.]*');
  if(~isempty(Istart))
    newStr = Str(Istart(end)+1:end);
    newStr = strrep(newStr,')','');
  else
      newStr = Str;
  end
  set(Childs(i),'DisplayName',newStr);
end