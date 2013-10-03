function [ descriptor ] = placeLabel( signal, positionDescriptor, name )
% function [ descriptor ] = placeLabel( signal, positionDescriptor, name )
%
% places a text label on a figure at the position specified by
% positionDescriptor
%
% WARNING: this script is not implementes as complete as the documentation
%          might make you believe
%
% required arguments
% ==================
% signal : a java Signal
% 
% optional arguments
% ==================
% positionDescriptor : a structure or string that describes where to put the label
%                      DEFAULT: 'relativePosition'
%                               
% name : an optional alternative name
%                      DEFAULT: signal.getYName()
%
% outputs
% =======
% descriptor is the filled out positionDescriptor.  It will contain the
% values as set in positionDescriptor, completed with the default
% field values and the field values calculated based on the filled out
% fields.  (NOTE: in the future, it is possible that only the valid fields
% from the input positionDescriptor will be retained in the returned descriptor )
%
% positionDescriptor
% ==================
% the intention is to provide a wide range of positions at which to
% position a label ( or several copies of a label, or a modified version of the label )
%
% If positionDescriptor is string, it will be interpreted as a shorthand
% for one of the positionDescriptor structures
%
% only a few options have been implemented yet.
%
% all types share the following options:
%
% always provided options:
%   positionDescriptor.type = {relativePosition} | crossings
%                             selects which type of selector to use
%                             more to be added
%                             DEFAULT: relativePosition
%   
%   font properties
%     interpreter: latex | {tex} | none  -- latex support seems poor
%     fontName   : e.g. Courier | FixedWidth
%     fontSize   : size of the font used ( default is 10 )
%     fontWeight : light | {normal} | demi | bold
%     fontAngle  : {normal} | italic | oblique
%     fontColor  : color of the font [ only supported with latex / tex -- select from below ]
%     rotation   : rotation in degrees (default: 0). positive angles cause
%                  counterclockwise rotation.  typical value is hence 90
%                  NOTE: check what this does with alignment
%                  
%     NOTE: text properties can be altered with tex / latex commands
%     e.g. for color :   
%       \color{colorname}   , with colors {red, green, yellow, magenta, blue, black, white } and {gray, darkGreen, orange, lightBlue}
%       \color[rg]{r g b}
%     e.g. for fontsize:
%       \fontsize{16}
%     e.g. 
%
%   text box properties
%     backgroundColor
%     edgeColor
%     lineWidth ( of edge ) 
%     linestyle ( of edge )
%     margin    ( space around text )
%
%   default text alignment ==> will most likely be overruled
%     horizontalAlignment = left | center | right
%     verticalAlignment = top | cap | {middle} | baseline | bottom
%                       
%
% relativePosition:  ( positioned against xmin, xmax, ymin, ymax )
%   type = 'relativePosition'
%   horizontalPosition = center | {left} | right  | coordinate (double)
%   verticalPosition = top | bottom | {middle}  | coordinate (double)
%     puts the label relative to the values of the signal.  
%     e.g. 'left' puts the leftmost point of the label at xmin, while
%          'right' puts the rightmost point of the label at xmax
%
% crossings:
%   type = 'crossings'
%   crossings = 'up' | 'down' | 'both'
%   threshold : yValue at which the crossing is detected
%                                  and at which the label is vertically centered
%   thresholdUp   : overrules threshold for up-transitions
%   thresholdDown : overrules threshold for
%                                      down-transitions
%   horizontalPosition : left | center | {right}
%
%   at which crossings should we put a label? 1st, 2nd and 5th ?
%   print the xValue in the label ?
%   put a marker on the crossing ?
%   print the number of the crossing ?
%   ...
%
%   extrema:
%     put a string at the local/global maxima, minima or extrema



    if nargin<1
       error( 'placeLabel requires a signal as argument' );       
    end
    if nargin>3
       error( 'placeLabel accepts only three arguments; %d provided', nargin );   
    end
    
    types = getTypes();
    
    if nargin==1
        positionDescriptor = types.relativePosition;
    end
    if nargin<=2
        name = char( signal.getYName() );
    end

    % fill out the missing descriptor fields
    if ischar( positionDescriptor )
        basicDescriptor.fullDefault=1;
        if strcmp( positionDescriptor, types.relativePosition )
            descriptor = updateDescriptorRelativePosition( basicDescriptor );
        elseif strcmp( positionDescriptor, types.crossings )
            %descriptor = basicDescriptor;
            error( 'crossings positionDescriptor is not yet implemented');                
        else
            error( 'unknown positionDescriptor string : "%s"', positionDescriptor );  
        end        
    end
    
    % make the actual 
    descriptor.functionToCall( signal, descriptor, name );

end

function [ types ] = getTypes( )
% function [ types ] = getTypes( )
%   provide a list of the available positionDescriptor types
%   just to avoid typos
    types.relativePosition='relativePosition';
    types.crossings='crossings';
end

function [ updatedDescriptor ] = updateDescriptorRelativePosition( inputDescriptor )
%function [ fullDescriptor ] = updateDescriptorRelativePosition( inputDescriptor )
%  
%  complete the descriptor with default or with values calculated based on
%  fields that are available in inputDescriptor
%   
%  label is positioned against xmin, xmax, ymin, ymax
%     e.g. 'left' puts the leftmost point of the label at xmin, while
%          'right' puts the rightmost point of the label at xmax
%
%  specific fields:
%       type = 'relativePosition'
%       horizontalPosition = center | {left} | right
%       verticalPosition = top | bottom | {center}
%       
    types = getTypes();

    descriptor = updateFontDescriptor( inputDescriptor );
    
    % basic fields
    if ~isfield( descriptor, 'type' ) 
        descriptor.type = types.relativePosition;
    end     
    if ~isfield( descriptor, 'horizontalPosition' ) 
        descriptor.horizontalPosition = 'left';
    end
    if ~isfield( descriptor, 'verticalPosition' ) 
        descriptor.verticalPosition = 'middle';
    end
    
    % text alignment ( TODO: check whether impact of rotation is acceptable)
    %   update it unless the position is specified as a coordinate    
    if ischar( descriptor.horizontalPosition )
        descriptor.horizontalAlignment = descriptor.horizontalPosition; 
    end
    if ischar( descriptor.verticalPosition )
        descriptor.verticalAlignment = descriptor.verticalPosition; 
    end
    
    
    % set function to call
    descriptor.functionToCall = @positionDescriptorPlaceLabel;
    
    updatedDescriptor = descriptor;
end

function [ updatedDescriptor ] = updateFontDescriptor( inputDescriptor )
%   font properties
%     interpreter: {latex} | tex | none
%     fontName   : e.g. Courier | FixedWidth
%     fontSize   : size of the font used ( default is 10 )
%     fontWeight : light | {normal} | demi | bold
%     fontAngle  : {normal} | italic | oblique
%     fontColor  : color of the font
%     rotation   : rotation in degrees (default: 0). positive angles cause
%                  counterclockwise rotation.  typical value is hence 90
%                  NOTE: check what this does with alignment
%
%   text box properties
%     backgroundColor
%     margin    ( space around text )
%     edgeColor
%     lineWidth ( of edge ) 
%     linestyle ( of edge )
%
%   default text alignment ==> will most likely be overruled
%     horizontalAlignment = left | center | right
%     verticalAlignment = top | cap | {middle} | baseline | bottom


    descriptor = inputDescriptor;
    
    % font
    if ~isfield( descriptor, 'interpreter' ) 
        descriptor.interpreter = 'tex';
    end     
    if ~isfield( descriptor, 'fontName' ) 
        descriptor.fontName = 'courier';
    end
    if ~isfield( descriptor, 'fontSize' ) 
        descriptor.fontSize = 10;
    end
    if ~isfield( descriptor, 'fontWeight' ) 
        descriptor.fontWeight = 'normal';
    end
    if ~isfield( descriptor, 'fontAngle' ) 
        descriptor.fontAngle = 'normal';
    end
    if ~isfield( descriptor, 'fontColor' ) 
        descriptor.fontColor = 'black';
    end
    if ~isfield( descriptor, 'rotation' ) 
        descriptor.rotation = 0;
    end
    
    % text box
    if ~isfield( descriptor, 'backgroundColor' ) 
        descriptor.backgroundColor = 'none';
    end
    if ~isfield( descriptor, 'margin' ) 
        descriptor.margin =  1;
    end
    if ~isfield( descriptor, 'edgeColor' ) 
        descriptor.edgeColor = 'none';
    end
    if ~isfield( descriptor, 'lineWidth' ) 
        descriptor.lineWidth = 1;
    end
    if ~isfield( descriptor, 'lineStyle' ) 
        descriptor.lineStyle = '-';
    end
    
    % text alignment - default values which will most likely be overwritten
    if ~isfield( descriptor, 'horizontalAlignment' ) 
        descriptor.horizontalAlignment = 'left';
    end
    if ~isfield( descriptor, 'verticalAlignment' ) 
        descriptor.verticalAlignment = 'middle';
    end
    
    updatedDescriptor = descriptor;
end

function [ ] = positionDescriptorPlaceLabel( signal, descriptor, name )
% function [ ] = positionDescriptorPlaceLabel( signal, descriptor, name )
%   place the labels on the current figure as indicated by the descriptor

    xmax = signal.getMaxX();
    xmin = signal.getMinX();
    ymax = signal.getMaxY();
    ymin = signal.getMinY();
    
    
    if strcmp( descriptor.horizontalPosition, 'left' )
        x = xmin;
    elseif strcmp( descriptor.horizontalPosition, 'right' ) 
        x = xmax;
    elseif strcmp( descriptor.horizontalPosition, 'center' )
        x=(xmin+xmax)/2;
    else
        error( 'unknown horizontalPosition "%s"', descriptor.horizontalPosition );
    end    
        
    if strcmp( descriptor.verticalPosition, 'top' )
        y = ymax;
    elseif strcmp( descriptor.verticalPosition, 'bottom' ) 
        y = ymin;
    elseif strcmp( descriptor.verticalPosition, 'middle' )
        y=(ymin+ymax)/2;
    else
        error( 'unknown verticalPosition "%s"', descriptor.verticalPosition );
    end

    if ~strcmp( descriptor.interpreter, 'none' ) % only supported with tex
        if ischar( descriptor.fontColor )
            name = sprintf( '\\color{%s}%s', descriptor.fontColor, name );
        elseif isnumeric( descriptor.FontColor ) && length( descriptor.FontColor )==3
            name = sprintf( '\\color[rg]{%g %g %g }', descriptor.FontColor(1:3), name );
        end
    end
    
    params = makeFontParams( {}, descriptor );
    
    %save parameters.mat x y name params descriptor
    
    text( x,y, name, params{:} ); 
end

function [ fontParams ] = makeFontParams( previousParams, descriptor )
% make a params structure that corresponds to the font settings
% as described in descriptor
%
% params{1} = 'ParameterName', params{2} = parameterValue


    fontParams = previousParams;
    
    fontParams{end+1} = 'Interpreter';  fontParams{end+1} = descriptor.interpreter;    
    fontParams{end+1} = 'FontName'   ;  fontParams{end+1} = descriptor.fontName;    
    fontParams{end+1} = 'FontSize'   ;  fontParams{end+1} = descriptor.fontSize;    
    fontParams{end+1} = 'FontWeight' ;  fontParams{end+1} = descriptor.fontWeight;    
    fontParams{end+1} = 'FontAngle'  ;  fontParams{end+1} = descriptor.fontAngle;        
    %fontParams{end+1} = 'FontColor'  ;  fontParams{end+1} = descriptor.fontColor;     
    % FontColor does not exist, but is emulated for tex and latex interpreter
    fontParams{end+1} = 'Rotation'   ;  fontParams{end+1} = descriptor.rotation;   
    
    
    fontParams{end+1} = 'BackgroundColor' ; fontParams{end+1} = descriptor.backgroundColor;    
    fontParams{end+1} = 'Margin'          ; fontParams{end+1} = descriptor.margin;    
    fontParams{end+1} = 'EdgeColor'       ; fontParams{end+1} = descriptor.edgeColor;    
    fontParams{end+1} = 'LineWidth'       ; fontParams{end+1} = descriptor.lineWidth;    
    fontParams{end+1} = 'Linestyle'       ; fontParams{end+1} = descriptor.lineStyle;
    
    fontParams{end+1} = 'HorizontalAlignment' ;  fontParams{end+1} = descriptor.horizontalAlignment;    
    fontParams{end+1} = 'VerticalAlignment'   ;  fontParams{end+1} = descriptor.verticalAlignment;   
    
end

%   alignment properties
%     alignments override the defaults derived by position-indicators, you
%     should not use them
%     
%     horizontalAlignment = left | center | right
%     verticalAlignment = top | cap | {middle} | baseline | bottom