function [ X1 ] = generateStartPoint( sp, parameterNames, parameterRanges )
% for each parameter for which sp contains a field, this is used to fill the start vector.
% otherwise, half of the provided range is used

Xmin = parameterRanges(:,1)';
Xmax = parameterRanges(:,2)';

X1 = (parameterRanges(:,2)+parameterRanges(:,1))'/2;

fns = fieldnames(sp);

i=0;
for param = parameterNames;
  i=i+1;
  p = param{:};
  hitI = find( strcmp( p, fns), 1);
  if length(hitI)>0
    X1( i ) = sp.(fns{hitI});
  end
end

