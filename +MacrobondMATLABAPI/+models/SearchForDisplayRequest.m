classdef SearchForDisplayRequest < MacrobondMATLABAPI.JSONMapper
% SearchForDisplayRequest Information about a search request with metadata as presentable text
% 
% SearchForDisplayRequest Properties:
%   includeDiscontinued - If True, discontinued entities will be included in the search - type: logical
%   filters - One or more filters that specifies what to search for - type: array of SearchFilter
%   attributesForDisplayFormat - Attributes to return that will be formatted for as presentable text. - type: array of string

% This file is automatically generated using OpenAPI
% Specification version: v1
% MATLAB Generator for OpenAPI version: 1.0.0


    % Class properties
    properties
        % includeDiscontinued - If True, discontinued entities will be included in the search - type: logical
        includeDiscontinued logical { MacrobondMATLABAPI.JSONMapper.fieldName(includeDiscontinued,"includeDiscontinued") }
        % filters - One or more filters that specifies what to search for - type: array of SearchFilter
        filters MacrobondMATLABAPI.models.SearchFilter { MacrobondMATLABAPI.JSONMapper.fieldName(filters,"filters"), MacrobondMATLABAPI.JSONMapper.JSONArray }
        % attributesForDisplayFormat - Attributes to return that will be formatted for as presentable text. - type: array of string
        attributesForDisplayFormat string { MacrobondMATLABAPI.JSONMapper.fieldName(attributesForDisplayFormat,"attributesForDisplayFormat"), MacrobondMATLABAPI.JSONMapper.JSONArray }
    end

    % Class methods
    methods
        % Constructor
        function obj = SearchForDisplayRequest(s,inputs)
            % To allow proper nesting of object, derived objects must
            % call the JSONMapper constructor from their constructor. This 
            % also allows objects to be instantiated with Name-Value pairs
            % as inputs to set properties to specified values.
            arguments
                s { MacrobondMATLABAPI.JSONMapper.ConstructorArgument } = []
                inputs.?MacrobondMATLABAPI.models.SearchForDisplayRequest
            end
            obj@MacrobondMATLABAPI.JSONMapper(s,inputs);
        end
    end %methods
end %class

