function [] = fprintf_EN( pattern, varargin )
% function [] = fprintf_EN( pattern, varargin )
%
%   similar to fprintf( pattern, varargin ), 
%     but with engineering notation support
%
%   see sprintf_EN help

    fprintf( '%s', sprintf_EN( pattern, varargin{:} ) );

end