classdef UnifiedSeriesEntry < macrobond.JSONMapper
% UnifiedSeriesEntry Request of a list of series converted to the same calendar
% 
% UnifiedSeriesEntry Properties:
%   name - The name of the series. - type: string
%   missingValueMethod - The method for filling in missing values. The default is the automatic method.  0 = None (Do not fill in missing values)  1 = Auto (Determine the method based on the series classification)  2 = PreviousValue (Use the previous non-missing value)  3 = ZeroValue (Use the value zero)  4 = LinearInterpolation (Do a linear interpolation) - type: SeriesMissingValueMethod
%   toLowerFrequencyMethod -   0 = Auto (Determine the method based on the series classification)  1 = Last (Use last observation in higher frequency when converting to lower frequency)  2 = First (Use first observation in higher frequency when converting to lower frequency)  3 = Flow (Use aggregate of observations in higher frequency when converting to lower frequency)  4 = PercentageChange (Use recalculated percentage changes when converting pp100 series to lower frequency)  5 = Highest (Use highest observation in higher frequency when converting to lower frequency)  6 = Lowest (Use lowest observation in higher frequency when converting to lower frequency)  7 = Average (Use average of observations in higher frequency when converting to lower frequency)  8 = ConditionalPercentageChange (Use recalculated percentage changes when converting pp100 series to lower frequency, but only if it actually has the pp100 attribute) - type: SeriesToLowerFrequencyMethod
%   toHigherFrequencyMethod -   0 = Auto (Determine the method based on the series classification)  1 = Same (Duplicate the lower frequency value for each of the higher frequency series positions)  2 = Distribute (Distribute the lower frequency value into equal sized parts for each of the higher frequency series positions)  3 = PercentageChange (Distribute the percentage change so that the product of the higher frequency observations - 100, is the same)  4 = LinearInterpolation (Use a linear interpolation between each pair of lower frequency values to fill in each of the higher frequency values)  5 = Pulse (Sets the value for the first observation in the period range and the other values to ''missing'')  6 = QuadraticDistribution (Use a quadratic interpolation that optimize the area under the lower frequency values to fill in the higher frequency values)  7 = CubicInterpolation (Use a cubic interpolation that optimize the area under the lower frequency values to fill in the higher frequency values)  8 = ConditionalPercentageChange (Distribute the percentage change so that the product of the higher frequency observations - 100, is the same, but only if pp100 is set on the series) - type: SeriesToHigherFrequencyMethod
%   partialPeriodsMethod -   0 = None (Type of partial period method when converting to lower frequency)  1 = Auto (Determine the method based on the series meta data)  2 = RepeatLastValue (Fill up the partial period by repeating the last value)  3 = FlowCurrentSum (Fill up the partial period with the average of the incomplete period)  4 = PastRateOfChange (Use the rate of change from the previous year to extend the partial period)  5 = Zero (Fill up the partial period with zeroes) - type: SeriesPartialPeriodsMethod
%   vintage - The vintage of the series. The default is the latest version of the series. - type: datetime

% This file is automatically generated using OpenAPI
% Specification version: v1
% MATLAB Generator for OpenAPI version: 1.0.0


    % Class properties
    properties
        % name - The name of the series. - type: string
        name string { macrobond.JSONMapper.fieldName(name,"name") }
        % missingValueMethod - The method for filling in missing values. The default is the automatic method.  0 = None (Do not fill in missing values)  1 = Auto (Determine the method based on the series classification)  2 = PreviousValue (Use the previous non-missing value)  3 = ZeroValue (Use the value zero)  4 = LinearInterpolation (Do a linear interpolation) - type: SeriesMissingValueMethod
        missingValueMethod  { macrobond.JSONMapper.fieldName(missingValueMethod,"missingValueMethod") }
        % toLowerFrequencyMethod -   0 = Auto (Determine the method based on the series classification)  1 = Last (Use last observation in higher frequency when converting to lower frequency)  2 = First (Use first observation in higher frequency when converting to lower frequency)  3 = Flow (Use aggregate of observations in higher frequency when converting to lower frequency)  4 = PercentageChange (Use recalculated percentage changes when converting pp100 series to lower frequency)  5 = Highest (Use highest observation in higher frequency when converting to lower frequency)  6 = Lowest (Use lowest observation in higher frequency when converting to lower frequency)  7 = Average (Use average of observations in higher frequency when converting to lower frequency)  8 = ConditionalPercentageChange (Use recalculated percentage changes when converting pp100 series to lower frequency, but only if it actually has the pp100 attribute) - type: SeriesToLowerFrequencyMethod
        toLowerFrequencyMethod  { macrobond.JSONMapper.fieldName(toLowerFrequencyMethod,"toLowerFrequencyMethod") }
        % toHigherFrequencyMethod -   0 = Auto (Determine the method based on the series classification)  1 = Same (Duplicate the lower frequency value for each of the higher frequency series positions)  2 = Distribute (Distribute the lower frequency value into equal sized parts for each of the higher frequency series positions)  3 = PercentageChange (Distribute the percentage change so that the product of the higher frequency observations - 100, is the same)  4 = LinearInterpolation (Use a linear interpolation between each pair of lower frequency values to fill in each of the higher frequency values)  5 = Pulse (Sets the value for the first observation in the period range and the other values to ''missing'')  6 = QuadraticDistribution (Use a quadratic interpolation that optimize the area under the lower frequency values to fill in the higher frequency values)  7 = CubicInterpolation (Use a cubic interpolation that optimize the area under the lower frequency values to fill in the higher frequency values)  8 = ConditionalPercentageChange (Distribute the percentage change so that the product of the higher frequency observations - 100, is the same, but only if pp100 is set on the series) - type: SeriesToHigherFrequencyMethod
        toHigherFrequencyMethod  { macrobond.JSONMapper.fieldName(toHigherFrequencyMethod,"toHigherFrequencyMethod") }
        % partialPeriodsMethod -   0 = None (Type of partial period method when converting to lower frequency)  1 = Auto (Determine the method based on the series meta data)  2 = RepeatLastValue (Fill up the partial period by repeating the last value)  3 = FlowCurrentSum (Fill up the partial period with the average of the incomplete period)  4 = PastRateOfChange (Use the rate of change from the previous year to extend the partial period)  5 = Zero (Fill up the partial period with zeroes) - type: SeriesPartialPeriodsMethod
        partialPeriodsMethod  { macrobond.JSONMapper.fieldName(partialPeriodsMethod,"partialPeriodsMethod") }
        % vintage - The vintage of the series. The default is the latest version of the series. - type: datetime
        vintage datetime { macrobond.JSONMapper.stringDatetime(vintage,'yyyy-MM-dd''T''HH:mm:ss.SSSZ', 'TimeZone', 'local'), macrobond.JSONMapper.fieldName(vintage,"vintage") }
    end

    % Class methods
    methods
        % Constructor
        function obj = UnifiedSeriesEntry(s,inputs)
            % To allow proper nesting of object, derived objects must
            % call the JSONMapper constructor from their constructor. This 
            % also allows objects to be instantiated with Name-Value pairs
            % as inputs to set properties to specified values.
            arguments
                s { macrobond.JSONMapper.ConstructorArgument } = []
                inputs.?macrobond.models.UnifiedSeriesEntry
            end
            obj@macrobond.JSONMapper(s,inputs);
        end
    end %methods
end %class

