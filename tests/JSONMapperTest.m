classdef JSONMapperTest < matlab.unittest.TestCase
    % Regression tests for generated JSON deserialization.

    methods (Test)
        function deserializesJsonNullMapValue(testCase)
            response = macrobond.models.EntityResponse( ...
                '{"metadata":{"nullableValue":null}}');

            testCase.verifyEmpty(response.metadata.nullableValue);
        end

        function deserializesNullableSeriesValuesAndDates(testCase)
            response = macrobond.models.SeriesResponse( ...
                "{""values"":[1,null,3],""dates"":[" + ...
                """2020-01-01T00:00:00Z"",null,""2020-01-03T00:00:00Z""]}");

            testCase.verifyEqual(response.values, [1 NaN 3]);
            testCase.verifyEqual(response.dates(1), ...
                datetime(2020, 1, 1, TimeZone="UTC"));
            testCase.verifyTrue(isnat(response.dates(2)));
            testCase.verifyEqual(response.dates(3), ...
                datetime(2020, 1, 3, TimeZone="UTC"));
        end

        function deserializesNullDiscriminator(testCase)
            node = macrobond.models.seriestree_getnodes_get_200_response_inner( ...
                '{"nodeType":null}');

            testCase.verifyEmpty(node.nodeType);
        end
    end
end
