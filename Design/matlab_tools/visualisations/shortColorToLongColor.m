function [ longName ] = shortColorToLongColor( shortName )
    
    if strcmp( shortName, 'r' )
        longName = 'red';
    end
    if strcmp( shortName, 'b' )
        longName = 'blue';
    end
    if strcmp( shortName, 'g' )
        longName = 'green';
    end
    if strcmp( shortName, 'm' )
        longName = 'magenta';
    end
    if strcmp( shortName, 'y' )
        longName = 'yellow';
    end
    if strcmp( shortName, 'k' )
        longName = 'black';
    end
    if strcmp( shortName, 'w' )
        longName = 'white';
    end
    if strcmp( shortName, 'c' )
        longName = 'cyan';
    end

end