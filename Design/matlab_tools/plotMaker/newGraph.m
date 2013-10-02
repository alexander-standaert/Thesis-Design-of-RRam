function [ plotS ] = newGraph( labelx, multx, labely, multy, graphTitle )
%  function [ plotS ] = newGraph( labelx, multx, labely, multy, graphTitle )
% e.g.   ps = newGraph( 'time [ps]', 1e12, 'voltage [V]', 1, 'joy' );


  plotS.xlabel=labelx;
  plotS.xmult =multx;
  plotS.ylabel=labely;
  plotS.ymult =multy;
  
  if( nargin<5 ) 
     plotS.title = ''; 
  else
     plotS.title = graphTitle;
  end
      
  
  
  plotS.xvalues={};
  plotS.yvalues={};
  plotS.name={};
  plotS.lineStyle={};
  plotS.color={};
  plotS.marker={};
  plotS.lineWidth={};
  plotS.maxXMarkerDistance={};
  plotS.maxYMarkerDistance={};
  
  plotS.type={};
  plotS.properties={};
  
end
