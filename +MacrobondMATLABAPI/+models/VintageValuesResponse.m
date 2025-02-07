classdef VintageValuesResponse < MacrobondMATLABAPI.JSONMapper
% VintageValuesResponse The values of a vintage
% 
% VintageValuesResponse Properties:
%   vintageTimeStamp - The time when this version of the series was recorded. It is omitted if the series does not have revision history and for the original set of values before any revisions were recorded. - type: datetime
%   dates - The dates of the vintage series. - type: array of datetime
%   values - The values of the vintage series. Missing values are represented by null. - type: array of double

% This file is automatically generated using OpenAPI
% Specification version: v1
% MATLAB Generator for OpenAPI version: 1.0.0


    % Class properties
    properties
        % vintageTimeStamp - The time when this version of the series was recorded. It is omitted if the series does not have revision history and for the original set of values before any revisions were recorded. - type: datetime
        vintageTimeStamp datetime { MacrobondMATLABAPI.JSONMapper.stringDatetime(vintageTimeStamp,'yyyy-MM-dd''T''HH:mm:ss.SSSZ', 'TimeZone', 'local'), MacrobondMATLABAPI.JSONMapper.fieldName(vintageTimeStamp,"vintageTimeStamp") }
        % dates - The dates of the vintage series. - type: array of datetime
        dates datetime { MacrobondMATLABAPI.JSONMapper.fieldName(dates,"dates"), MacrobondMATLABAPI.JSONMapper.JSONArray }
        % values - The values of the vintage series. Missing values are represented by null. - type: array of double
        values double { MacrobondMATLABAPI.JSONMapper.fieldName(values,"values"), MacrobondMATLABAPI.JSONMapper.JSONArray }
    end

    % Class methods
    methods
        % Constructor
        function obj = VintageValuesResponse(s,inputs)
            % To allow proper nesting of object, derived objects must
            % call the JSONMapper constructor from their constructor. This 
            % also allows objects to be instantiated with Name-Value pairs
            % as inputs to set properties to specified values.
            arguments
                s { MacrobondMATLABAPI.JSONMapper.ConstructorArgument } = []
                inputs.?MacrobondMATLABAPI.models.VintageValuesResponse
            end
            obj@MacrobondMATLABAPI.JSONMapper(s,inputs);
        end
    end %methods
end %class

