classdef JSONMapperTest < matlab.unittest.TestCase
    % Regression tests for generated JSON deserialization.

    methods (Test)
        function deserializesJsonNullMapValue(testCase)
            response = macrobond.models.EntityResponse( ...
                '{"metadata":{"nullableValue":null}}');

            testCase.verifyEmpty(response.metadata.nullableValue);
        end
    end
end
