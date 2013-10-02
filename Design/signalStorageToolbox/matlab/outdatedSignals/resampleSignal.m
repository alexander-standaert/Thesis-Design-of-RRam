function [ resampled ] = resampleSignal( in, xValues )
%  function [ resampled ] = resampleSignal( in, xValues )
%
%    make a linear interpolation with the given xValues

    if isjava( in )
        import be.kuleuven.micas.signals.*;
        resampled.xValues = in.getXValues()';
        resampled.yValues = in.getYValues()';
        in2 = resampled;
    else
        resampled = in; 
        in2=in;
    end

    [ xo I ] = sort(in2.xValues);
    yo = in2.yValues(I);

    xn = xValues;
    yn = zeros( 1, length(xValues) );

    for i=1:length(xValues)
        x=xn(i);
        index = find( xo>=x, 1);
        if length( index )==0
            msg='extrapolating';
            error(msg);
        end
        if index(1)==1
            yn(i) = yo(i);
        else
            alpha = (x-xo(index-1))/(xo(index)-xo(index-1));
            yn(i) = (1-alpha) * yo(index-1) + alpha * yo(index); 
        end
    end

    resampled.xValues=xn;
    resampled.yValues=yn;
    
    if isjava( in )
       import be.kuleuven.micas.signals.*;
       t = Signal( resampled.xValues, in.getXName(), in.getXUnit(), ...
                   resampled.yValues, in.getYName(), in.getYUnit() );          
       resampled = t;
    end
    
end