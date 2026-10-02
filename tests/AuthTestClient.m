classdef AuthTestClient < macrobond.api.Metadata
    % Test helper exposing protected authentication behavior.

    methods
        function request = authenticatedRequest(obj, authNames)
            request = matlab.net.http.RequestMessage;
            httpOptions = matlab.net.http.HTTPOptions;
            uri = matlab.net.URI("http://127.0.0.1");
            [request, ~, ~] = obj.requestAuth(authNames, request, httpOptions, uri);
        end
    end
end
