function fhandle =  plotStripped(varargin) 
%
% creates a new strip (without xaxis), and plot inside
%
    customSubPlot(gcf,1)
    if nargout > 0
        fhandle = plot(varargin{:}) ;
    else
        plot(varargin{:}) ;
    end

end