classdef SeriesPartialPeriodsMethod < MacrobondMATLABAPI.JSONEnum
% SeriesPartialPeriodsMethod   0 = None (Type of partial period method when converting to lower frequency)  1 = Auto (Determine the method based on the series meta data)  2 = RepeatLastValue (Fill up the partial period by repeating the last value)  3 = FlowCurrentSum (Fill up the partial period with the average of the incomplete period)  4 = PastRateOfChange (Use the rate of change from the previous year to extend the partial period)  5 = Zero (Fill up the partial period with zeroes)

    % This file is automatically generated using OpenAPI
    % Specification version: v1
    % MATLAB Generator for OpenAPI version: 1.0.0
    

    properties  (Constant)
        baseType = "int32"
    end

    enumeration 
        None (int32(0))
        Auto (int32(1))
        RepeatLastValue (int32(2))
        FlowCurrentSum (int32(3))
        PastRateOfChange (int32(4))
        Zero (int32(5))
    end

end %class

