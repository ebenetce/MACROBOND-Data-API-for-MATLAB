classdef OpenAPIMockTest < matlab.unittest.TestCase
    % Contract test for the generated client against an OpenAPI mock server.

    methods (Test, TestTags = "Contract")
        function metadataRequestUsesMockServer(testCase)
            mockServerUrl = string(getenv("OPENAPI_MOCK_URL"));
            testCase.fatalAssertNotEmpty(mockServerUrl, ...
                "Set OPENAPI_MOCK_URL to run the OpenAPI contract tests.");

            configFile = string(tempname) + ".json";
            settings = struct( ...
                serverUri=mockServerUrl, ...
                bearerToken="test-token", ...
                expiresAt=int64(posixtime(datetime("now"))) + int64(3600));
            writelines(jsonencode(settings), configFile);
            testCase.addTeardown(@() delete(configFile));

            client = macrobond.api.Metadata(configFile=configFile);
            [code, ~, response] = client.metadataGetattributeinformationGet("test");

            testCase.verifyEqual(int32(code), int32(200));
            testCase.verifyEqual(int32(response.StatusCode), int32(200));
        end
    end
end
