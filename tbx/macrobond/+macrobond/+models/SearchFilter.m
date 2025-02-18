classdef SearchFilter < macrobond.JSONMapper
% SearchFilter A filter in a search request
% 
% SearchFilter Properties:
%   entityTypes - One or more entity types to include in the search. An empty list will include all types. If not specified, the search will be made for TimeSeries. - type: array of string
%   mustHaveValues - Pairs of attributes and values to be matched against entities when searching - type: macrobond.JSONMapperMap
%   mustNotHaveValues - Pairs of attributes and values to exclude entities when searching - type: macrobond.JSONMapperMap
%   mustHaveAttributes - Attributes to be matched against entities when searching. Any value will match. - type: array of string
%   mustNotHaveAttributes - Attributes to exclude entities when searching. Any value will match. - type: array of string
%   text - Words to search for separated by space. - type: string
%   mustHaveFilterListPath - Optional path to filter list that is added to the set of MustHaveValues. The paths are typically obtained from a call ListFilterLists. - type: string

% This file is automatically generated using OpenAPI
% Specification version: v1
% MATLAB Generator for OpenAPI version: 1.0.0


    % Class properties
    properties
        % entityTypes - One or more entity types to include in the search. An empty list will include all types. If not specified, the search will be made for TimeSeries. - type: array of string
        entityTypes string { macrobond.JSONMapper.fieldName(entityTypes,"entityTypes"), macrobond.JSONMapper.JSONArray }
        % mustHaveValues - Pairs of attributes and values to be matched against entities when searching - type: macrobond.JSONMapperMap
        mustHaveValues  { macrobond.JSONMapper.fieldName(mustHaveValues,"mustHaveValues") }
        % mustNotHaveValues - Pairs of attributes and values to exclude entities when searching - type: macrobond.JSONMapperMap
        mustNotHaveValues  { macrobond.JSONMapper.fieldName(mustNotHaveValues,"mustNotHaveValues") }
        % mustHaveAttributes - Attributes to be matched against entities when searching. Any value will match. - type: array of string
        mustHaveAttributes string { macrobond.JSONMapper.fieldName(mustHaveAttributes,"mustHaveAttributes"), macrobond.JSONMapper.JSONArray }
        % mustNotHaveAttributes - Attributes to exclude entities when searching. Any value will match. - type: array of string
        mustNotHaveAttributes string { macrobond.JSONMapper.fieldName(mustNotHaveAttributes,"mustNotHaveAttributes"), macrobond.JSONMapper.JSONArray }
        % text - Words to search for separated by space. - type: string
        text string { macrobond.JSONMapper.fieldName(text,"text") }
        % mustHaveFilterListPath - Optional path to filter list that is added to the set of MustHaveValues. The paths are typically obtained from a call ListFilterLists. - type: string
        mustHaveFilterListPath string { macrobond.JSONMapper.fieldName(mustHaveFilterListPath,"mustHaveFilterListPath") }
    end

    % Class methods
    methods
        % Constructor
        function obj = SearchFilter(s,inputs)
            % To allow proper nesting of object, derived objects must
            % call the JSONMapper constructor from their constructor. This 
            % also allows objects to be instantiated with Name-Value pairs
            % as inputs to set properties to specified values.
            arguments
                s { macrobond.JSONMapper.ConstructorArgument } = []
                inputs.?macrobond.models.SearchFilter
            end
            obj@macrobond.JSONMapper(s,inputs);
        end
    end %methods
end %class

