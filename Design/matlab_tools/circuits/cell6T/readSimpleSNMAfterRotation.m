function [ snm snm1 snm2 square1 square2 ] = readSimpleSNMAfterRotation( c1, c2, doPlot )

if( isjava(c1) )
  h = c1.getYValues-c2.getYValues();
  x = c1.getXValues();
  x1 = c1.getXValues();
  x2 = c2.getXValues();
  y1 = c1.getYValues();
  y2 = c2.getYValues();
else    
  h = c1.yValues-c2.yValues;
  x = c1.xValues;
  x1 = c1.xValues;
  x2 = c2.xValues;
  y1 = c1.yValues;
  y2 = c2.yValues;
end

  %note: h-passings from low to high (seen from left to right) are stable 
  %      points
 
  stableIndices   = find( ( h(1:end-1)<0  ) .* ( h(2:end)>=0 ) );
  unstableIndices = find( ( h(1:end-1)>=0 ) .* ( h(2:end)<0  ) );

  if doPlot
    figure(7)
    plot( x1, y1,'r-' );
    hold on
    plot( x2, y2,'k-' );
    plot( x2, h ,'b-' );
    if length( stableIndices )>0
        plot( x( stableIndices   ), 0, 'sb' );
    end
    if length( unstableIndices )>0
        plot( x( unstableIndices ), 0, 'dr' );
    end
  end

  if length( stableIndices ) ==2  && length(unstableIndices)==1
    % normal situation
    st1 = stableIndices(1);
    st2 = stableIndices(2);
    ms  = unstableIndices(1);
    [ snm1a I1 ] = max( h(st1:ms) );
    [ snm2a I2 ] = max(-h(ms:st2) );
    snm1 = snm1a / sqrt(2);
    snm2 = snm2a / sqrt(2);    
    snm = min( snm1, snm2 );
    
    I1 = I1+st1-1;
    I2 = I2+ms-1;
    square1.x1 = x( I1 );
    square1.y1 = y1( I1 );
    square1.x2 = x( I1 );
    square1.y2 = y2( I1 );
    
    square2.x1 = x( I2 );
    square2.y1 = y1( I2 );
    square2.x2 = x( I2 );
    square2.y2 = y2( I2 );
    
    return
  end  
  
  if length( stableIndices ) >2  && length( unstableIndices )>=1
    % we assume this means that the mostright stable state will evolve to
    % the low value when the read operation is released,
    % while the mostleft stable state will evolve the the high value
    % when the read operation is released.
    % this is not verified, and probably not even true!
    %
    % This assumes that the stable points in the middle will evolve
    % towards a metastable situation when the wl voltage is released
    
%    stableIndices
%    unstableIndices
    
    st1 = stableIndices(1);
    ms1 = unstableIndices( find( unstableIndices > st1,1  ) );
    st2 = stableIndices(end);
    ms2 = unstableIndices( find( unstableIndices < st2, 1, 'last' ) );
    [snm1a I1 ]= max( h(st1:ms1) );
    [snm2a I2] = max(-h(ms2:st2) );
    snm1 = snm1a / sqrt(2);
    snm2 = snm2a / sqrt(2);
    snm = min( snm1, snm2 );
        
    I1 = I1+st1-1;
    I2 = I2+ms2-1;
    square1.x1 = x( I1 );
    square1.y1 = y1( I1 );
    square1.x2 = x( I1 );
    square1.y2 = y2( I1 );
    
    square2.x1 = x( I2 );
    square2.y1 = y1( I2 );
    square2.x2 = x( I2 );
    square2.y2 = y2( I2 );
    
    
    return
  end

  if length( stableIndices ) <=2  
    % cell is unstable.  We try to give an indication of how much snm
    % improvement is needed to get a stable cell ...
    
    L = length( h );

    [ snm1a I1 ] = max( h(1         :ceil(L/2) ) );
    [ snm2a I2 ] = max(-h(floor(L/2):end       ) );
    snm1 = snm1a / sqrt(2);
    snm2 = snm2a / sqrt(2);
    
    snm = min( snm1, snm2 );
         
    I1 = I1+1-1;
    I2 = I2+floor(L/2)-1;
    square1.x1 = x( I1 );
    square1.y1 = y1( I1 );
    square1.x2 = x( I1 );
    square1.y2 = y2( I1 );
    
    square2.x1 = x( I2 );
    square2.y1 = y1( I2 );
    square2.x2 = x( I2 );
    square2.y2 = y2( I2 );
    
    return
  end



 L = length( h );

 [ snm1a I1 ] = max( h(1         :ceil(L/2) ) );
 [ snm2a I2 ] = max(-h(floor(L/2):end       ) );
 snm1 = snm1a / sqrt(2);
 snm2 = snm2a / sqrt(2);
    
 snm = min( snm1, snm2 );
         
 I1 = I1+1-1;
 I2 = I2+floor(L/2)-1;
 square1.x1 = x( I1 );
 square1.y1 = y1( I1 );
 square1.x2 = x( I1 );
 square1.y2 = y2( I1 );
    
 square2.x1 = x( I2 );
 square2.y1 = y1( I2 );
 square2.x2 = x( I2 );
 square2.y2 = y2( I2 );
 return

end


% --------------------
  
