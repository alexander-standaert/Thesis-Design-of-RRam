function [plottedIndices] = visualise2D( paramNames, paramValues, X, Y, ...
                                         Xlabel, Ylabel,  ...
                                         parameterMin, parameterMax, ...
                                         Xmin, Xmax, Ymin, Ymax, ...
                                         styleDefiningParameters )
%%function [plottedIndices] = visualise2D( paramNames, paramValues, X, Y, ...
%%                                         Xlabel, Ylabel,  ...
%%                                         parameterMin, parameterMax, ...
%%                                         Xmin, Xmax, Ymin, Ymax, ...
%%                                         styleDefiningParameters )
%% A function to visualise the results of simulations in which a relatively
%% large number of input-parameters are swept and result in two metrics X and Y
%% with labels Xlabel and Ylabel
%%
%% paramNames is a cell array containing the names of the parameters that
%% are being swept 
%% e.g. paramNames= { 'param1', 'param2', 'param3' }
%%
%% paramValues is a vector of values the parameters take:
%% e.g. paramValues = [ param1_1 param2_1 param3_1 ;
%%                      param1_2 param2_2 param3_2 ;
%%                      ...
%%                      param1_n param2_n param3_n ]
%% 
%%
%% X and Y are the respective metrics to be plotted.  
%% e.g. X(i), Y(i) is the result corresponding with 
%%      param1_i, param2_im param3_i
%%
%%
%% parameterMin and parameterMax contain the limits over which the 
%% parameter values are swept
%%
%% e.g. parameterMin = [ param1_min  param2_min param3_min ;
%% e.g. parameterMax = [ param1_max  param2_max param3_max ];
%%
%% if parameterMin(i)==-inf, no lower bound on parameter i is used
%% if parameterMax(i)== inf, no upper bound in parameter i is used
%%
%% Xmin, Xmax, Ymin, Ymax: limits on the function results  
%%
%% X and Y should be simple vectors 
%%
%% styleDefiningParameters contains the parameternames used to select a 
%% symbol and edge/face color
%% e.g. styleDefiningParameters = { 'p1', 'p2' } 
%% results in a different symbol for each combination of (p1,p2)
%% Symbol is interpreted as a combination of form and size.  When possible,
%% we attempt to make a smart choice in how to assign forms and sizes to
%% the different combinations...
%%
%% plottedIndices: the indices that have been plotted 
%% (e.g. fulfulling the imposed requirements on parameters and result values)
%%

%% Step 1: find the indices that fulfill the imposed constraints:
selectMask = (X>=Xmin) .* (X<=Xmax) .* (Y>=Ymin) .* (Y<=Ymax);
matches = sum(selectMask);
fprintf( 1,'constraints on parameter X and Y applied, %d matches remain\n', ...
           matches );

pl = length( paramNames );
for pi = 1:pl
  pmin = parameterMin( pi );
  pmax = parameterMax( pi );
  selectMask = selectMask .* (paramValues( :, pi )' >= pmin) .* ...
                             (paramValues( :, pi )' <= pmax);
  pname = paramNames{ pi };
  matches = sum(selectMask);
  fprintf( 1,'constraints on parameter %s applied, %d matches remain\n', ...
             pname, matches );
end
select = find( selectMask );
plottedIndices = select;


%%styleDefiningParameters = { symbolDefiningParameters{:}, ...
%%                            colorDefiningParameters{:} };

%% step 2: find all different combinations of parameters in 
%%         the style-defining parameters

remainingPoints = select;
%% when a point has been processed, the index in remainingPoints is set to 0
groupId=1;
clear groupStyle;
clear groups;

i=1;
while 1
  %%take the first point
  firstIndex = find( remainingPoints>0 ,1 );
  %index into remainingPoints or into select
  % use X( select( index ) ) to access the original data
  
  fprintf('firstIndex: %d\n', firstIndex );
  
  if length( firstIndex )==0 
    break;
  end
  
  %%find all other indices that belong to this group...
  groupMask = ones( length(select), 1 );  
  % indices into remainingPoints/select
  description='';
  pvals = zeros( length(styleDefiningParameters) ,1 );
  for pi = 1:length(styleDefiningParameters)
    pname = styleDefiningParameters{pi};
    pcol = find( strcmp( paramNames, pname ),1 );
    pval = paramValues( select( firstIndex ), pcol ); 
    groupMask = groupMask .* ( paramValues( select, pcol ) == pval );
    description = sprintf( '%s, %s=%g', description, pname, pval );
    pvals(pi) = pval;
  end


  group.groupIndices = select( find( groupMask ) );
  group.description  = description; 
  group.pvals = pvals;
  groups{i} = group;

  remainingPoints( find(groupMask) ) =0;
  i=i+1;
end

%% 3. now, assign styles to each group and plot the result
clear styleTable;  
% styleTable = { styleTable1, styleTable2, styleTable3, styleTable4 }
% styleTable{i} = [ pval1 pval2 pval3 pval4 ...]
styleTable{1} = [];
styleTable{2} = [];
styleTable{3} = [];
styleTable{4} = [];

mylegend = cell( length(groups) , 1); 

for i=1:length(groups)
  pvals = groups{i}.pvals;
  
  for j=1:length(pvals)
    val = pvals(j);
    index = find(styleTable{j}==val ,1);
    if length( index )==0 
      k = length(styleTable{j});
      styleTable{j}(k+1) = val;
      index = k+1;
    end
    styleIndex(j) = index;
  end
  style = getStyle( styleIndex );
  groups{i}.style = style;

  myplot( X( groups{i}.groupIndices ), Y( groups{i}.groupIndices ), style );
  hold on;
 
  fprintf(1, 'plotted group %d: %s (%d elements) \n', ...
          i, groups{i}.description, length( groups{i}.groupIndices ) );
   
  mylegend{i} = groups{i}.description;
end

xlabel( Xlabel );
ylabel( Ylabel );
legend( mylegend );
