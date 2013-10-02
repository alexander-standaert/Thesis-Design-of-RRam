function [ result ] = parseResult_cell6T( cell, runMap )
% function [ result ] = parseResult_cell6T( cell )
%
%   this function parses the results of the simulations for a 6T cell   
%
%   <runMap> is the folder where simulation commands were performed 
%   <cell> is a circuit, typically obtained by a call to getCell6T() 
%    ( or a clone of this file )
%   
%   use cell.plotId = 0 to avoid plotting
%
    if nargin<2
       runMap=cell.runMap; 
    end

    %runMap = cell.runMap;
    
    fprintf( '==================== cell = %s\n', runMap );
    
    cell.realMap = runMap;  % temp variable
    
    result.dummy = 1;  % to avoid not-assigned

    %% read operation : SNM and n-Curve
    id = cell.id.SNM;
    if( cell.performSimulations( id  ) )    
        SNM             = analyseSNM( cell, id );    
        result.SNM_1    = SNM.SNM_1;
        result.SNM_2    = SNM.SNM_2;
        result.SNM      = SNM.SNM;            
        
        nCurve          = analyseNcurve( cell, id );
        result.SINM_1   = nCurve.SINM_1;
        result.SINM_2   = nCurve.SINM_2;
        result.SINM     = nCurve.SINM;    
        result.SVNM_1   = nCurve.SVNM_1;
        result.SVNM_2   = nCurve.SVNM_2;
        result.SVNM     = nCurve.SVNM;            
 
    end
    
    %% hold:  SNM and n-Curve
    id = cell.id.SNMhold;
    if( cell.performSimulations( id ) )    
        SNMhold     = analyseSNM( cell, id );
        result.SNMhold_1    = SNMhold.SNM_1;
        result.SNMhold_2    = SNMhold.SNM_2;
        result.SNMhold      = SNMhold.SNM;
        
        nCurveHold          = analyseNcurve( cell, id );
        result.SINMhold_1   = nCurveHold.SINM_1;
        result.SINMhold_2   = nCurveHold.SINM_2;
        result.SINMhold     = nCurveHold.SINM;
        result.SVNMhold_1   = nCurveHold.SVNM_1;
        result.SVNMhold_2   = nCurveHold.SVNM_2;
        result.SVNMhold     = nCurveHold.SVNM;

    end
    
    %% write: write trip point WTP
    id = cell.id.WTP;
    if( cell.performSimulations( id ) )
        WTP          = analyseWTP( cell, id );
        result.WTP_0  = WTP.WTP_0;
        result.WTP_1  = WTP.WTP_1;        
        result.WTP    = WTP.WTP;
        result.WTPI_0 = WTP.WTPI_0;        
        result.WTPI_1 = WTP.WTPI_1;        
        result.WTPI   = WTP.WTPI;       
    end

    %% currents : leakage currents during standby and read currents
    id = cell.id.I;
    if( cell.performSimulations( id ) ) 
        resultI           = analyseI(   cell, id );        
        
        result.structI     = resultI;  %contains all individual currents in all states, but harder to use than the flat structures
                
        result.read0_Iread = resultI.read0.Iread; %should be negative
        result.read0_Q     = resultI.read0.Q;
        result.read0_QBar  = resultI.read0.QBar;
        
        result.read1_Iread = resultI.read1.Iread; % should be positive
        result.read1_Q     = resultI.read1.Q;
        result.read1_QBar  = resultI.read1.QBar;
        
        result.Iread = min( -result.read0_Iread, result.read1_Iread ); % line not verified yet
        
        result.hold0_Ileak = resultI.hold0.Ileak;
        result.hold0_Q     = resultI.hold0.Q;
        result.hold0_QBar  = resultI.hold0.QBar;
        
        result.hold1_Ileak = resultI.hold1.Ileak;
        result.hold1_Q     = resultI.hold1.Q;
        result.hold1_QBar  = resultI.hold1.QBar;
                
    end
    
    cellPrintResultStructure( result );

%     result.Ncurve     = resultNcurve;
%     result.SNMhold          = resultSNMhold;
%     result.NcurveHold = resultNcurveHold;
%     result.WTP              = resultWTP;
%     result.I                = resultI;

    return;

end


%% analyse N-curve
function [ result ] = analyseNcurve( cell, simId )
  file = sprintf('%s%s.raw/sweepSNM.dc', cell.realMap, dropExtensionAndPath( cell.testNetlists{ simId } ) );
  
  try 
      sim = readPsfAscii( file );
  catch e
    fprintf( 'WARNING (parseResult_cell6T): simulation output "%s" cannot be opened\n', file );
    e
    result.SINM = NaN;
    result.SVNM = NaN;
    result.WTI  = NaN;
    result.WTV  = NaN;
  
    result.SINM_1 = NaN;
    result.SVNM_1 = NaN;
    result.WTI_1  = NaN;
    result.WTV_1  = NaN;
  
    result.SINM_2 = NaN;
    result.SVNM_2 = NaN;
    result.WTI_2  = NaN;
    result.WTV_2  = NaN;
    
    result.InWhenQFixed    = getSignalTemplate( 'filler' );
    result.InWhenQBarFixed = getSignalTemplate( 'filler' );
    return;
  end
%  sim = simulations{1};

  InWhenQFixed    = getSignal( sim, 'VQ1:1'    );
  InWhenQBarFixed = getSignal( sim, 'VQBar2:1' );
    
  [ SINM1 SVNM1 WTI1 WTV1 ] = doSingleSideNcurve( InWhenQFixed   , 'Q'   , simId*10+5, cell.plotId );
  [ SINM2 SVNM2 WTI2 WTV2 ] = doSingleSideNcurve( InWhenQBarFixed, 'QBar', simId*10+6, cell.plotId );
  
  result.SINM = min( SINM1, SINM2 );
  result.SVNM = min( SVNM1, SVNM2 );
  result.WTI  = min( WTI1, WTI2 );
  result.WTV  = min( WTV1, WTV2 );
  
  result.SINM_1 = SINM1;
  result.SVNM_1 = SVNM1;
  result.WTI_1  = WTI1;
  result.WTV_1  = WTV1;
  
  result.SINM_2 = SINM2;
  result.SVNM_2 = SVNM2;
  result.WTI_2  = WTI2;
  result.WTV_2  = WTV2;
    
  result.InWhenQFixed = InWhenQFixed;
  result.InWhenQBarFixed = InWhenQBarFixed;
end

function [ SIM SVM WTI WTV ] = doSingleSideNcurve( In, name, plotIndex, doPlot )
  % SIM and SVM are measured between the first stable and metastable point
  % WTI and WTV are measured between this first metastable and last stable point
  % name is the node that is fixed with a voltage source
  %% calculate
  if isjava( In )
    xValues = In.getXValues();
  else
    xValues = In.xValues;  
  end

  xmax = max( xValues );
  xmin = min( xValues );

  step=(xmax-xmin)/200;
  xv = xmin:step:xmax;
  
  if isjava( In )
    iSignalJava = resampleSignal( In, xv );
    iSignal.yValues = - ( iSignalJava.getYValues() );  %invert the signal
    iSignal.xValues = iSignalJava.getXValues();
  else
    iSignal = resampleSignal( In, xv );
    iSignal.yValues = - iSignal.yValues;  
  end
  
  positive = iSignal.yValues >= 0 ;
  negative = iSignal.yValues <  0 ;

  % find first positive area.  This is the area where Imargin and
  % Vmargin has to be measured
  index1 = find( positive, 1 );
  index2 = find( negative( index1:end ), 1  ) + index1 - 1 ;
  
  if length(index2)==0  
    %     no negative part after the first positive crossing...
    % ==> only one stable point, data is lost ...    
    SVM=0; SIM=0; WTI=0; WTV=0;    
  else           
    SVM = iSignal.xValues( index2 ) - iSignal.xValues( index1 );
    [ SIM SIMindex] = max( iSignal.yValues( index1:index2 ) ); 
    SIMindex = SIMindex + index1 -1; 
    index3 = find( negative, 1, 'last' ) ;
    [ WTI WTIindex ] = min( iSignal.yValues( index2:index3 ) );
    WTI= -WTI;
    WTIindex = WTIindex + index2 - 1 ; 
    WTV = iSignal.xValues( index3 ) - iSignal.xValues( index2 )  ;
  end
  
  %% plot
  if doPlot
    myxlabel = sprintf( 'V(%s) [mV]', name );  
    ps = newGraph( myxlabel, 1e3, 'I [{\mu}A]', 1e6 );    
  
    mylabel = sprintf( 'I needed to enforce V(%s)', name );
    ps = addGraph( ps, iSignal.xValues, iSignal.yValues, mylabel, '-', 'k', '', 1 );
  
  
    
    if( SVM~=0 )
      % SVM
      x1 = iSignal.xValues( index1 );
      x2 = iSignal.xValues( index2 )
      mylabel = sprintf( 'SVNM=%dmV',round(SVM*1000) );
      ps=addGraph( ps, [x1 x2 ], [ 0 0 ], mylabel, '--', 'r', 'd', 1, 0 );
      
      % SIM
      x = iSignal.xValues( SIMindex );
      mylabel = sprintf( 'SINM=%duA',round(SIM*1e6) );      
      ps=addGraph( ps, [x x ], [ 0 SIM ], mylabel, '--', 'b', 's', 1, 0 );
          
      % WTV    
      x2 = iSignal.xValues( index2 );
      x3 = iSignal.xValues( index3 );

      mylabel = sprintf( 'WTV=%dmV',round(WTV*1000) );      
      ps=addGraph( ps, [ x2 x3 ], [ 0 0 ], mylabel, '--', 'm', '*', 1, 0 );
     
      % WTI
      x = iSignal.xValues( WTIindex );
      line( [ x x ] , [ 0 -WTI ] );
      mylabel = sprintf( 'WTI=%duA',round(WTI*1e6) );      
      ps=addGraph( ps, [ x x ], [ 0 -WTI ], mylabel, '--', 'b', 'h', 1, 0 );     
      
    end
    plotGraph( ps, plotIndex );  
 
  end
end

%% analyse SNM
function [ result ] = analyseSNM( cell, simId )

  file = sprintf('%s%s.raw/sweepSNM.dc', cell.realMap, dropExtensionAndPath( cell.testNetlists{ simId } ) );
  try
    sim = readPsfAscii( file );  
  catch e
    fprintf( 'WARNING (parseResult_cell6T): simulation output "%s" cannot be opened\n', file );
    e
    result.SNM   = NaN;
    result.SNM_1 = NaN;
    result.SNM_2 = NaN;
    result.x0    = NaN;
    result.y0    = NaN;
    return
  end
  
  
  signalQBarWhenQFixed=getSignal( sim, 'QBar1' ); 
  signalQWhenQBarFixed=getSignal( sim, 'Q2'    );
  
  SNM.signalQBarWhenQFixed = signalQBarWhenQFixed;
  SNM.signalQWhenQBarFixed = signalQWhenQBarFixed;
  
  figureId=0;  %detailed internal plots ...  0=disable    
  
  try 
    [ SNM.SNM SNM.SNM_1 SNM.SNM_2 SNM.square1 SNM.square2 ] = calculateSNM( sim, figureId );  
    [ SNM.x0 SNM.y0 ] = getCrossings( signalQBarWhenQFixed, signalQWhenQBarFixed );
  catch e
    fprintf( 'WARNING (parseResult_cell6T): SNM cannot be calculated from "%s"\n', file );
    e
    result.SNM   = NaN;
    result.SNM_1 = NaN;
    result.SNM_2 = NaN;
    result.x0    = NaN;
    result.y0    = NaN;
    return
  end
  
  result = SNM;
  
  
  if cell.plotId
    ps = newGraph( ['Q [mV]' ], 1e3, 'QBar [mV]', 1e3, 'butterfly curve' );    
    ps = addGraph( ps, signalQBarWhenQFixed.getXValues(), signalQBarWhenQFixed.getYValues(), 'QBar when Q swept', '-' , 'b', '', 2 );
    ps = addGraph( ps, signalQWhenQBarFixed.getYValues(), signalQWhenQBarFixed.getXValues(), 'Q when QBar swept', '--', 'r', '', 2 );

    ps = addGraph( ps, SNM.square1.xValues, SNM.square1.yValues, '', '-'  , 'k', '', 0 );
    ps = addGraph( ps, SNM.square2.xValues, SNM.square2.yValues, '', '-'  , 'k', '', 0 );

  
    plotGraph( ps, simId*10+1 );   
  
    %addCrossings( signalQBarWhenQFixed, signalQWhenQBarFixed );
    
    %addSNM( SNM.SNM_1, SNM.square1 );
    %addSNM( SNM.SNM_2, SNM.square2 );
  end   
end




function [] = addCrossings( signalQBarWhenQFixed, signalQWhenQBarFixed )
% additional graph info
  [x0,y0]=getCrossings( signalQBarWhenQFixed, signalQWhenQBarFixed );
  x0=x0*1000;
  y0=y0*1000;
  for i=1:length(x0);
      plot( [ x0(i) ], [ y0(i) ], 'o', 'markerSize', 12 );    
      mytext = sprintf( '(%d, %d)', round(x0(i)), round(y0(i)) );
      text( x0(i)+20, y0(i)+20, mytext );
  end
end

function [ x0 y0 ] = getCrossings( signalQBarWhenQFixed, signalQWhenQBarFixed );
% additional graph info
  if isjava( signalQWhenQBarFixed )    
    x1 = signalQBarWhenQFixed.getXValues();
    y1 = signalQBarWhenQFixed.getYValues();
    x2 = signalQWhenQBarFixed.getYValues();
    y2 = signalQWhenQBarFixed.getXValues();  
  else
%     a = signalQBarWhenQFixed;
%     b = signalQWhenQBarFixed;
%     b.xValues = signalQWhenQBarFixed.yValues;
%     b.yValues = signalQWhenQBarFixed.xValues;
   
    x1 = signalQBarWhenQFixed.xValues;
    y1 = signalQBarWhenQFixed.yValues;
    x2 = signalQWhenQBarFixed.yValues;
    y2 = signalQWhenQBarFixed.xValues;
  end
  
  [x0,y0]=intersections(x1,y1,x2,y2);
end


function [] = addSNM( snmValue, square ) 
  xm = 1000*( min( square.xValues ) + max( square.xValues ) )/2;
  yb = 1000*min( square.yValues );
  mytext = sprintf( '%dmV', round( snmValue*1000)  );
  text( xm, yb, mytext, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top' );
  
  ym = 1000*( min( square.yValues ) + max( square.yValues ) )/2;
  xr = 1000*max( square.xValues );  
  text( xr, ym, mytext, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle' );

end


%% analyse WTP
function [ result ] = analyseWTP( cell, simId )

  %file = sprintf('%s%s.raw/sweepWTP.dc', cell.realMap, cell.testNetlists{ simId } );
  file = sprintf('%s%s.raw/tranWTP.tran', cell.realMap, dropExtensionAndPath( cell.testNetlists{ simId } ) );
  try
    sim = readPsfAscii( file );
  catch e  
    fprintf( 'WARNING (parseResult_cell6T): simulation output "%s" cannot be opened\n', file );
    e
    result.WTP_0  = NaN;
    result.WTPI_0 = NaN;
    result.WTP_1  = NaN;
    result.WTPI_1 = NaN;
    result.WTP    = NaN;
    result.WTPI   = NaN;
    return;
  end
    
    
  %write 0
  Q = getSignal( sim, 'Q1' ); 
  QBar = getSignal( sim, 'QBar1' ); 
  LBL = getSignal( sim, 'LBL1' ); 
  LBLBar = getSignal( sim, 'LBLBar1' ); 
  ILBL    = getSignal( sim, 'VLBL1:1' ); 
  ILBLBar = getSignal( sim, 'VLBLBar1:1' );  
  expectedEndState = 0;  
  plotId = (simId*10+1) * (cell.plotId>0);
  [result.WTP_0 result.WTPI_0 ] = findSingleWriteTripPoint( Q, QBar, LBL, LBLBar, ILBL, ILBLBar, expectedEndState, plotId );
  
  %write 1
  Q = getSignal( sim, 'Q2' ); 
  QBar = getSignal( sim, 'QBar2' ); 
  LBL = getSignal( sim, 'LBL2' ); 
  LBLBar = getSignal( sim, 'LBLBar2' );   
  ILBL    = getSignal( sim, 'VLBL2:1' ); 
  ILBLBar = getSignal( sim, 'VLBLBar2:1' );  
  expectedEndState = 1;  
  plotId = (simId*10+5) * (cell.plotId>0);
  [result.WTP_1 result.WTPI_1 ] = findSingleWriteTripPoint( Q, QBar, LBL, LBLBar, ILBL, ILBLBar, expectedEndState, plotId );

  result.WTP  = min( result.WTP_0 , result.WTP_1  );  
  result.WTPI = min( result.WTPI_0, result.WTPI_1 );  
    
end
    
function [WTP WTPI ] = findSingleWriteTripPoint( Q_in, QBar_in, LBL_in, LBLBar_in, ILBL_in, ILBLBar_in, expectedEndState, plotId )

  if isjava( Q_in )
      Q = javaSignalToMatlab( Q_in );
      QBar = javaSignalToMatlab( QBar_in );
      LBL = javaSignalToMatlab( LBL_in );
      LBLBar = javaSignalToMatlab( LBLBar_in );
      ILBL = javaSignalToMatlab( ILBL_in );
      ILBLBar = javaSignalToMatlab( ILBLBar_in );
  end
    

  if( expectedEndState==0 )
    sweptLabel = 'BL';
    LBLx = LBL.yValues;      
  else
    sweptLabel = 'BLBar';    
    LBLx = LBLBar.yValues;  
  end

  delta = Q.yValues - QBar.yValues;          
  index = find( ( delta(2:end) .* delta(1:end-1)   ) <= 0 , 1 ) + 1;  
  % find first toggle index and take the safer side

  if length( index ) > 0 
    WTP = LBLx( index );
  else
    % two options: 
    % value started swapped in the first place:
    %   WTP=vdd
    % cell could not be written
    %   WTP =-inf
    if( expectedEndState==0 )
        if( Q.yValues(1) < QBar.yValues(1) )  
           WTP=LBLx(1);    % we start from the intended endstate ...
        else
           WTP=-inf;            
        end
    end
    if( expectedEndState==1 )
        if( Q.yValues(1) > QBar.yValues(1) )
           WTP=LBLx(1); 
        else
           WTP=-inf;
        end
    end    
  end
    
  WTPI = max( max( abs( ILBL.yValues ) , abs( ILBLBar.yValues ) ) );  %%pretty useless as it is
  
  if plotId ~=0       
    myTitle = sprintf( 'WTP curve ( Q starts at %d, write %d )', 1-expectedEndState, expectedEndState );

        
    ps = newGraph( [sweptLabel ' [mV]' ], 1e3, 'voltage [mV]', 1e3, myTitle );    
    ps = addGraph( ps, LBLx , LBLx        , sweptLabel   , '-'  , 'k', '',  0, 100e-3 );
    ps = addGraph( ps, LBLx , Q.yValues   , 'Q'          , '-'  , 'b', 'o', 1, 100e-3 );
    ps = addGraph( ps, LBLx , QBar.yValues, 'QBar'       , '--' , 'r', '+', 1, 100e-3 ); 
    %if length( index ) > 0
    %  ps=addGraph( ps, LBLx(index) * [ 1 1 ], [ -1 1 ] , '', '-', 'm', 'p', 2 );
    %end
    plotGraph( ps, plotId );   
           
    myTitle = sprintf( 'WTPI curve ( Q starts at %d, write %d )', 1-expectedEndState, expectedEndState );
    ps = newGraph( [sweptLabel ' [mV]' ], 1e3, 'bitline currents [{\mu}A]', 1e6, myTitle );    
    ps = addGraph( ps, LBLx , ILBL.yValues   , 'current from BL'   , '-'  , 'b', 'o', 1, 100e-3 );
    ps = addGraph( ps, LBLx , ILBLBar.yValues, 'current from BLBar', '--' , 'r', '+', 1, 100e-3 );    
    plotGraph( ps, plotId+1 );   
    
    a=axis();
    axis( [ a(1:3) 20 ] );
  end
  
        
end


%% analyse currents
function [ result ] = analyseI( cell, simId )
  % TODO: why doe we use transient simulation only (and only that one?)
  %
  %file = sprintf('%s%s.raw/myDC.dc', cell.realMap, cell.testNetlists{ simId } );
  file = sprintf('%s%s.raw/myTran.tran', cell.realMap, dropExtensionAndPath( cell.testNetlists{ simId } ) );
  try
    sim = readPsfAscii( file );
  catch e  
    fprintf( 'WARNING (parseResult_cell6T): simulation output "%s" cannot be opened\n', file );
    e
    result.read0.Iread = NaN;
    result.read1.Iread = NaN;
    result.hold0.Ileak = NaN;
    result.hold1.Ileak = NaN;
    return;
  end

% try
  result.read0 = getCurrents( sim, 1, 'XIread0' );
  result.read0.Iread  = result.read0.IBL-result.read0.IBLBar; 

  result.read1 = getCurrents( sim, 2, 'XIread1' );
  result.read1.Iread  = result.read1.IBL-result.read1.IBLBar;  
  

    result.hold0 = getCurrents( sim, 3, 'XIoff0' );
    result.hold0.Ileak  = -( result.hold0.IBL + result.hold0.IBLBar + result.hold0.Ivdd + result.hold0.IvddBulk );
  
    result.hold1 = getCurrents( sim, 4, 'XIoff1' );
    result.hold1.Ileak  = -( result.hold1.IBL + result.hold1.IBLBar + result.hold1.Ivdd + result.hold1.IvddBulk);
%   catch e
%     fprintf( 'parseResult_cell6T: failed to extract leakage currents\n' );
%     result.hold0 = 'extraction failed';  
%     result.hold1 = 'extraction failed';  
%   end
  
end

function [ state ] = getCurrents( sim, index, instanceName ) 
  
  state.Q        = getValue0(sim, sprintf( 'Q%d'         , index) );
  state.QBar     = getValue0(sim, sprintf( 'QBar%d'      , index) );
  state.IBL      = getValue0(sim, sprintf( 'VLBL%d:p'    , index) );
  state.IBLBar   = getValue0(sim, sprintf( 'VLBLBar%d:p' , index) );
  state.Ivdd     = getValue0(sim, sprintf( 'VvddCell%d:p', index) );
  state.Ivss     = getValue0(sim, sprintf( 'VvssCell%d:p', index) );
  state.IvddBulk = getValue0(sim, sprintf( 'VvddBulk%d:p', index) );
  state.IvssBulk = getValue0(sim, sprintf( 'VvssBulk%d:p', index) );
  state.IWL      = getValue0(sim, sprintf( 'Vwl%d:p'  , index) ); 

  %sim.getAllNames()
  
  if  ~isempty( sim.getNamesForFilter('.*\.mos.*' ) )
     nmosName='mos';
     pmosName='mos';
  elseif ~isempty( sim.getSignalsForFilter('.*\.mpmos.*' ) ) %/ mnmos
     nmosName='mnmos';
     pmosName='mpmos';
  elseif ~isempty( sim.getSignalsForFilter( '.*\.Mn:d' ) ) % Marie's compact model
     nmosName='Mn';
     pmosName='Mp';
  else
      error( 'can''t find name for transistor currents' );
  end
  
  if 1
    iN = instanceName;  
    currents.MpuL_g = getValue0(sim, sprintf( '%s.Mpu_left.%s:g', iN, pmosName ) ); 
    currents.MpuL_s = getValue0(sim, sprintf( '%s.Mpu_left.%s:s', iN, pmosName ) ); 
    currents.MpuL_d = getValue0(sim, sprintf( '%s.Mpu_left.%s:d', iN, pmosName ) ); 
    currents.MpuL_b = getValue0(sim, sprintf( '%s.Mpu_left.%s:b', iN, pmosName ) ); 

    currents.MpuR_g = getValue0(sim, sprintf( '%s.Mpu_right.%s:g', iN, pmosName  ) ); 
    currents.MpuR_s = getValue0(sim, sprintf( '%s.Mpu_right.%s:s', iN, pmosName  ) ); 
    currents.MpuR_d = getValue0(sim, sprintf( '%s.Mpu_right.%s:d', iN, pmosName  ) ); 
    currents.MpuR_b = getValue0(sim, sprintf( '%s.Mpu_right.%s:b', iN, pmosName  ) ); 
    
    currents.MpgL_g = getValue0(sim, sprintf( '%s.Mpg_left.%s:g', iN, nmosName ) ); 
    currents.MpgL_s = getValue0(sim, sprintf( '%s.Mpg_left.%s:s', iN, nmosName ) ); 
    currents.MpgL_d = getValue0(sim, sprintf( '%s.Mpg_left.%s:d', iN, nmosName ) ); 
    currents.MpgL_b = getValue0(sim, sprintf( '%s.Mpg_left.%s:b', iN, nmosName ) ); 

    currents.MpgR_g = getValue0(sim, sprintf( '%s.Mpg_right.%s:g', iN, nmosName ) ); 
    currents.MpgR_s = getValue0(sim, sprintf( '%s.Mpg_right.%s:s', iN, nmosName ) ); 
    currents.MpgR_d = getValue0(sim, sprintf( '%s.Mpg_right.%s:d', iN, nmosName ) ); 
    currents.MpgR_b = getValue0(sim, sprintf( '%s.Mpg_right.%s:b', iN, nmosName ) ); 
    
    currents.MpdL_g = getValue0(sim, sprintf( '%s.Mpd_left.%s:g', iN, nmosName ) ); 
    currents.MpdL_s = getValue0(sim, sprintf( '%s.Mpd_left.%s:s', iN, nmosName ) ); 
    currents.MpdL_d = getValue0(sim, sprintf( '%s.Mpd_left.%s:d', iN, nmosName ) ); 
    currents.MpdL_b = getValue0(sim, sprintf( '%s.Mpd_left.%s:b', iN, nmosName ) ); 

    currents.MpdR_g = getValue0(sim, sprintf( '%s.Mpd_right.%s:g', iN, nmosName ) ); 
    currents.MpdR_s = getValue0(sim, sprintf( '%s.Mpd_right.%s:s', iN, nmosName ) ); 
    currents.MpdR_d = getValue0(sim, sprintf( '%s.Mpd_right.%s:d', iN, nmosName ) ); 
    currents.MpdR_b = getValue0(sim, sprintf( '%s.Mpd_right.%s:b', iN, nmosName ) ); 
      
    state.currents = currents;
  end
  
end



function [ value ] = getValue0( sim, name )
% get the last yvalue from the signal with the given name
% name is very confusing ...

  signal  = sim.getSignal( name );
  yValues = signal.getYValues();
  value   = yValues(end);
end