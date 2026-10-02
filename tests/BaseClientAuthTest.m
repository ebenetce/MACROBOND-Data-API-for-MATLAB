classdef BaseClientAuthTest < matlab.unittest.TestCase
    % Tests for non-interactive authentication behavior.

    methods (Test)
        function cachedTokenAddsBearerAuthorizationHeader(testCase)
            configFile = createConfigFile( ...
                "cached-token", int64(posixtime(datetime("now"))) + int64(3600));
            testCase.addTeardown(@() delete(configFile));
            client = AuthTestClient(configFile=configFile);
            request = client.authenticatedRequest(["ClientDirectAccess", "auth"]);
            authorization = request.getFields("Authorization");

            testCase.verifyEqual(string(authorization.Value), "Bearer cached-token");
        end

        function authorizationCodeFlowIsReportedAsUnsupported(testCase)
            configFile = createConfigFile("unused", int64(0));
            testCase.addTeardown(@() delete(configFile));
            client = AuthTestClient(configFile=configFile);

            testCase.verifyError(@() client.authenticatedRequest("auth"), ...
                "macrobond:UnknownOAuth");
        end

        function publicConfigurationSelectsPreferredAuthMethod(testCase)
            client = AuthTestClient( ...
                serverUri="http://127.0.0.1:4010", ...
                preferredAuthMethod="auth");

            testCase.verifyError( ...
                @() client.authenticatedRequest(["ClientDirectAccess", "auth"]), ...
                "macrobond:UnknownOAuth");
        end
    end
end

function configFile = createConfigFile(token, expiresAt)
configFile = string(tempname) + ".json";
settings = struct( ...
    serverUri="http://127.0.0.1", ...
    bearerToken=token, ...
    expiresAt=expiresAt);
writelines(jsonencode(settings), configFile);
end
