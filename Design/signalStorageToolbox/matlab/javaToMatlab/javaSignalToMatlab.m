function [ matlabSignal ] = javaSignalToMatlab( javaSignal )
%function [ matlabSignal ] = javaSignalToMatlab( javaSignal )
%
% Convert a java signal to a matlab signal with fields
% signal.xValues
% signal.xName
% signal.xUnit
% signal.yValues
% signal.yName
% signal.yUnit
%

    matlabSignal.xValues = javaSignal.getXValues();
    matlabSignal.xName   = javaSignal.getXName();
    matlabSignal.xUnit   = javaSignal.getXUnit();
    matlabSignal.yValues = javaSignal.getYValues();
    matlabSignal.yName   = javaSignal.getYName();
    matlabSignal.yUnit   = javaSignal.getYUnit();

end
