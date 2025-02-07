classdef SeriesMissingValueMethod < MacrobondMATLABAPI.JSONEnum
% SeriesMissingValueMethod   0 = None (Do not fill in missing values)  1 = Auto (Determine the method based on the series classification)  2 = PreviousValue (Use the previous non-missing value)  3 = ZeroValue (Use the value zero)  4 = LinearInterpolation (Do a linear interpolation)

    % This file is automatically generated using OpenAPI
    % Specification version: v1
    % MATLAB Generator for OpenAPI version: 1.0.0
    

    properties  (Constant)
        baseType = "int32"
    end

    enumeration 
        None (int32(0))
        Auto (int32(1))
        PreviousValue (int32(2))
        ZeroValue (int32(3))
        LinearInterpolation (int32(4))
    end

end %class

