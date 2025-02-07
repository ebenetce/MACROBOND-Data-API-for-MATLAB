classdef SeriesToHigherFrequencyMethod < MacrobondMATLABAPI.JSONEnum
% SeriesToHigherFrequencyMethod   0 = Auto (Determine the method based on the series classification)  1 = Same (Duplicate the lower frequency value for each of the higher frequency series positions)  2 = Distribute (Distribute the lower frequency value into equal sized parts for each of the higher frequency series positions)  3 = PercentageChange (Distribute the percentage change so that the product of the higher frequency observations - 100, is the same)  4 = LinearInterpolation (Use a linear interpolation between each pair of lower frequency values to fill in each of the higher frequency values)  5 = Pulse (Sets the value for the first observation in the period range and the other values to ''missing'')  6 = QuadraticDistribution (Use a quadratic interpolation that optimize the area under the lower frequency values to fill in the higher frequency values)  7 = CubicInterpolation (Use a cubic interpolation that optimize the area under the lower frequency values to fill in the higher frequency values)  8 = ConditionalPercentageChange (Distribute the percentage change so that the product of the higher frequency observations - 100, is the same, but only if pp100 is set on the series)

    % This file is automatically generated using OpenAPI
    % Specification version: v1
    % MATLAB Generator for OpenAPI version: 1.0.0
    

    properties  (Constant)
        baseType = "int32"
    end

    enumeration 
        Auto (int32(0))
        Same (int32(1))
        Distribute (int32(2))
        PercentageChange (int32(3))
        LinearInterpolation (int32(4))
        Pulse (int32(5))
        QuadraticDistribution (int32(6))
        CubicInterpolation (int32(7))
        ConditionalPercentageChange (int32(8))
    end

end %class

