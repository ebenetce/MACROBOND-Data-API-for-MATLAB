classdef Search < macrobond.BaseClient
    % Search No description provided
    %
    % Search Properties:
    %
    %   serverUri           - Base URI to use when calling the API. Allows using a different server
    %                         than specified in the original API spec.
    %   httpOptions         - HTTPOptions used by all requests.
    %   preferredAuthMethod - If operation supports multiple authentication methods, specified which
    %                         method to prefer.
    %   bearerToken         - If Bearer token authentication is used, the token can be supplied 
    %                         here. Note the token is only used if operations are called for which
    %                         the API explicitly specified that Bearer authentication is supported.
    %                         If this has not been specified in the spec but most operations do 
    %                         require Bearer authentication, consider adding the relevant header to
    %                         all requests in the preSend method.
    %   apiKey              - If API key authentication is used, the key can be supplied here. 
    %                         Note the key is only used if operations are called for which
    %                         the API explicitly specified that API key authentication is supported.
    %                         If this has not been specified in the spec but most operations do 
    %                         require API key authentication, consider adding the API key to all
    %                         requests in the preSend method.
    %   httpCredentials     - If Basic or Digest authentication is supported username/password
    %                         credentials can be supplied here as matlab.net.http.Credentials. Note 
    %                         these are only actively used if operations are called for which the 
    %                         API spec has specified they require Basic authentication. If this has
    %                         not been specified in the spec but most operations do require
    %                         Basic authentication, consider setting the Credentials property in the
    %                         httpOptions rather than through httpCredentials.
    %   cookies             - Cookie jar. The cookie jar is shared across all Api classes in the 
    %                         same package. All responses are automatically parsed for Set-Cookie
    %                         headers and cookies are automatically added to the jar. Similarly
    %                         cookies are added to outgoing requests if there are matching cookies 
    %                         in the jar for the given request. Cookies can also be added manually
    %                         by calling the setCookies method on the cookies property. The cookie
    %                         jar is also saved to disk (cookies.mat in the same directory as 
    %                         BaseClient) and reloaded in new MATLAB sessions.
    %
    % Search Methods:
    %
    %   Search - Constructor
    %   searchEntitiesGet - Search for time series and other entites
    %   searchEntitiesPost - Search for time series and other entites
    %   searchEntitiesfordisplayPost - Search for time series and other entites and return formatted metadata
    %   searchFilterlistsGet - Get a list of saved filter lists
    %
    % See Also: matlab.net.http.HTTPOptions, matlab.net.http.Credentials, 
    %   CookieJar.setCookies, macrobond.BaseClient

    % This file is automatically generated using OpenAPI
    % Specification version: v1
    % MATLAB Generator for OpenAPI version: 1.0.0
    

    % Instruct MATLAB Code Analyzer to ignore unnecessary brackets
    %#ok<*NBRAK2> 

    % Class properties
    properties
    end

    % Class methods
    methods
        function obj = Search(options)
            % Search Constructor, creates a Search instance.
            % When called without inputs, tries to load configuration
            % options from JSON file 'macrobond.Client.Settings.json'.
            % If this file is not present, the instance is initialized with 
            % default configuration option. An alternative configuration 
            % file can be provided through the "configFile" Name-Value pair.
            % All other properties of the instance can also be overridden 
            % using Name-Value pairs where Name equals the property name.
            % 
            % Examples:
            %
            %   % Create a client with default options and serverUri
            %   % as parsed from OpenAPI spec (if available)
            %   client = macrobond.api.Search();
            %
            %   % Create a client for alternative server/base URI
            %   client = macrobond.api.Search("serverUri","https://example.com:1234/api/");
            %
            %   % Create a client loading configuration options from 
            %   % JSON configuration file
            %   client = macrobond.api.Search("configFile","myconfig.json");
            %
            %   % Create a client with alternative HTTPOptions and an API key
            %   client = macrobond.api.Search("httpOptions",...
            %       matlab.net.http.HTTPOptions("ConnectTimeout",42),...
            %       "apiKey", "ABC123");

            arguments
                options.configFile string
                options.?macrobond.BaseClient
            end
            % Call base constructor to override any configured settings
            args = namedargs2cell(options);
            obj@macrobond.BaseClient(args{:})
        end

        function [code, result, response] = searchEntitiesGet(obj, filter, optionals)
            % searchEntitiesGet Search for time series and other entites
            % Search for time series and other entites matching attribute values. If the same attribute name is specified more than once, then entities matching any of them will be included. If the value is *, any value will match. If ! is specified before an attribute name, entities matching the value will be excluded instead of included. OAuth scope: macrobond_web_api.search_mb
            %
            % Required parameters:
            %   filter - One or more attribute=value or !attribute=value pairs., Type: macrobond.JSONMapperMap
            %
            % Optional name-value parameters:
            %   entityType - Specify one or more entity types to search for. Use * to search for all types. The default is TimeSeries., Type: array
            %   includeDiscontinued - If true, include discontinued series in the search., Type: logical
            %   noMetaData - If true, do not include full metadata in the response., Type: logical
            %   allowLongResult - If true, allow for longer search results. noMetaData must be set to true., Type: logical
            %   text - Specify one or more words to search for. Words are separated by space., Type: string
            %
            % Responses:
            %   200: The operation was successful
            %   400: Request failed
            %   404: At least one attribute was not found
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: SearchResponse
            %
            % See Also: macrobond.models.SearchResponse

            arguments
              obj macrobond.api.Search
              filter macrobond.models.macrobond.JSONMapperMap
              optionals.entityType string
              optionals.includeDiscontinued logical
              optionals.noMetaData logical
              optionals.allowLongResult logical
              optionals.text string
            end

            % Create the request object
            request = matlab.net.http.RequestMessage();
            
            % Verify that operation supports returning JSON
            specAcceptHeaders = [...
                "application/json", ...
            ];
            if ismember("application/json",specAcceptHeaders)
                request.Header(end+1) = matlab.net.http.field.AcceptField('application/json');
            else
                error("macrobond:api:searchEntitiesGet:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' MediaType.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","searchEntitiesGet")
            end
            
            % No body input, so no need to check its content type
            
            % No header parameters

            % Configure default httpOptions
            httpOptions = obj.httpOptions;
            % Never convert API response
            httpOptions.ConvertResponse = false;

            % Configure request verb/method
            request.Method = matlab.net.http.RequestMethod('GET');

            % Build the request URI
            if ~isempty(obj.serverUri)
                % If URI specified in object, use that
                uri = obj.serverUri;
            else
                % If no server specified use base path from OpenAPI spec
                uri = matlab.net.URI("https://api.macrobondfinancial.com");
            end
            % Append the operation end-point
            uri.EncodedPath = uri.EncodedPath + "/v1/search/entities";

            % No path parameters

            % Set query parameters
            if isfield(optionals, "entityType"), uri.Query(end+1) = matlab.net.QueryParameter("entityType", optionals.entityType, matlab.net.ArrayFormat.repeating); end
            if isfield(optionals, "includeDiscontinued"), uri.Query(end+1) = matlab.net.QueryParameter("includeDiscontinued", optionals.includeDiscontinued); end
            if isfield(optionals, "noMetaData"), uri.Query(end+1) = matlab.net.QueryParameter("noMetaData", optionals.noMetaData); end
            if isfield(optionals, "allowLongResult"), uri.Query(end+1) = matlab.net.QueryParameter("allowLongResult", optionals.allowLongResult); end
            if isfield(optionals, "text"), uri.Query(end+1) = matlab.net.QueryParameter("text", optionals.text); end
            uri.Query(end+1) = matlab.net.QueryParameter("filter", filter);
            
            % No JSON body parameters

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
                "auth", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("searchEntitiesGet", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("searchEntitiesGet", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
                    result = macrobond.models.SearchResponse(response.Body.Data);
                case 400
                    result = response.Body.Data;
                case 404
                    result = response.Body.Data;
                case 401
                    result = response.Body.Data;
                case 403
                    result = response.Body.Data;
                case 429
                    result = response.Body.Data;
                otherwise % Unexpected output, not declared in spec
                    % Any response in the OK range will not throw a warning
                    if (int32(response.StatusCode) < 200 || int32(response.StatusCode) >= 300)
                        % Others will throw a warning
                        warning("macrobond:api:searchEntitiesGet:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","searchEntitiesGet",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % searchEntitiesGet method

        function [code, result, response] = searchEntitiesPost(obj, SearchRequest)
            % searchEntitiesPost Search for time series and other entites
            % Search for time series and other entites matching attribute values. OAuth scope: macrobond_web_api.search_mb
            %
            % Required parameters:
            %   SearchRequest - One or more search filters., Type: SearchRequest
            %       Required properties in the model for this call:
            %       Optional properties in the model for this call:
            %           includeDiscontinued
            %           filters
            %           noMetadata
            %           allowLongResult
            %
            % No optional parameters
            %
            % Responses:
            %   200: The operation was successful
            %   400: Request failed
            %   404: At least one attribute was not found
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: SearchResponse
            %
            % See Also: macrobond.models.SearchResponse

            arguments
              obj macrobond.api.Search
              SearchRequest macrobond.models.SearchRequest
            end

            % Create the request object
            request = matlab.net.http.RequestMessage();
            
            % Verify that operation supports returning JSON
            specAcceptHeaders = [...
                "application/json", ...
            ];
            if ismember("application/json",specAcceptHeaders)
                request.Header(end+1) = matlab.net.http.field.AcceptField('application/json');
            else
                error("macrobond:api:searchEntitiesPost:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' MediaType.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","searchEntitiesPost")
            end
            
            % Verify that operation supports JSON or FORM as input
            specContentTypeHeaders = [...
                "application/json", ...
                "text/json", ...
                "application/*+json", ...
            ];
            if ismember("application/json",specContentTypeHeaders)
                request.Header(end+1) = matlab.net.http.field.ContentTypeField('application/json');
            elseif ismember("application/x-www-form-urlencoded",specContentTypeHeaders)
                request.Header(end+1) = matlab.net.http.field.ContentTypeField('application/x-www-form-urlencoded');
            else
                error("macrobond:api:searchEntitiesPost:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' and 'application/x-www-form-urlencoded' MediaTypes.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","searchEntitiesPost")
            end
            
            % No header parameters

            % Configure default httpOptions
            httpOptions = obj.httpOptions;
            % Never convert API response
            httpOptions.ConvertResponse = false;

            % Configure request verb/method
            request.Method = matlab.net.http.RequestMethod('POST');

            % Build the request URI
            if ~isempty(obj.serverUri)
                % If URI specified in object, use that
                uri = obj.serverUri;
            else
                % If no server specified use base path from OpenAPI spec
                uri = matlab.net.URI("https://api.macrobondfinancial.com");
            end
            % Append the operation end-point
            uri.EncodedPath = uri.EncodedPath + "/v1/search/entities";

            % No path parameters

            % No query parameters
            
            % Set JSON Body
            requiredProperties = [...
            ];
            optionalProperties = [...
                "includeDiscontinued",...
                "filters",...
                "noMetadata",...
                "allowLongResult",...
            ];
            request.Body(1).Payload = SearchRequest.getPayload(requiredProperties,optionalProperties);

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
                "auth", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("searchEntitiesPost", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("searchEntitiesPost", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
                    result = macrobond.models.SearchResponse(response.Body.Data);
                case 400
                    result = response.Body.Data;
                case 404
                    result = response.Body.Data;
                case 401
                    result = response.Body.Data;
                case 403
                    result = response.Body.Data;
                case 429
                    result = response.Body.Data;
                otherwise % Unexpected output, not declared in spec
                    % Any response in the OK range will not throw a warning
                    if (int32(response.StatusCode) < 200 || int32(response.StatusCode) >= 300)
                        % Others will throw a warning
                        warning("macrobond:api:searchEntitiesPost:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","searchEntitiesPost",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % searchEntitiesPost method

        function [code, result, response] = searchEntitiesfordisplayPost(obj, SearchForDisplayRequest)
            % searchEntitiesfordisplayPost Search for time series and other entites and return formatted metadata
            % Search for time series and other entites matching attribute values and return the selected metadata formatted for presentation purposes. OAuth scope: macrobond_web_api.read_structure
            %
            % Required parameters:
            %   SearchForDisplayRequest - One or more search filters., Type: SearchForDisplayRequest
            %       Required properties in the model for this call:
            %           attributesForDisplayFormat
            %       Optional properties in the model for this call:
            %           includeDiscontinued
            %           filters
            %
            % No optional parameters
            %
            % Responses:
            %   200: The operation was successful
            %   400: Request failed
            %   404: At least one attribute was not found
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: SearchForDisplayResponse
            %
            % See Also: macrobond.models.SearchForDisplayResponse

            arguments
              obj macrobond.api.Search
              SearchForDisplayRequest macrobond.models.SearchForDisplayRequest
            end

            % Create the request object
            request = matlab.net.http.RequestMessage();
            
            % Verify that operation supports returning JSON
            specAcceptHeaders = [...
                "application/json", ...
            ];
            if ismember("application/json",specAcceptHeaders)
                request.Header(end+1) = matlab.net.http.field.AcceptField('application/json');
            else
                error("macrobond:api:searchEntitiesfordisplayPost:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' MediaType.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","searchEntitiesfordisplayPost")
            end
            
            % Verify that operation supports JSON or FORM as input
            specContentTypeHeaders = [...
                "application/json", ...
                "text/json", ...
                "application/*+json", ...
            ];
            if ismember("application/json",specContentTypeHeaders)
                request.Header(end+1) = matlab.net.http.field.ContentTypeField('application/json');
            elseif ismember("application/x-www-form-urlencoded",specContentTypeHeaders)
                request.Header(end+1) = matlab.net.http.field.ContentTypeField('application/x-www-form-urlencoded');
            else
                error("macrobond:api:searchEntitiesfordisplayPost:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' and 'application/x-www-form-urlencoded' MediaTypes.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","searchEntitiesfordisplayPost")
            end
            
            % No header parameters

            % Configure default httpOptions
            httpOptions = obj.httpOptions;
            % Never convert API response
            httpOptions.ConvertResponse = false;

            % Configure request verb/method
            request.Method = matlab.net.http.RequestMethod('POST');

            % Build the request URI
            if ~isempty(obj.serverUri)
                % If URI specified in object, use that
                uri = obj.serverUri;
            else
                % If no server specified use base path from OpenAPI spec
                uri = matlab.net.URI("https://api.macrobondfinancial.com");
            end
            % Append the operation end-point
            uri.EncodedPath = uri.EncodedPath + "/v1/search/entitiesfordisplay";

            % No path parameters

            % No query parameters
            
            % Set JSON Body
            requiredProperties = [...
                "attributesForDisplayFormat",...
            ];
            optionalProperties = [...
                "includeDiscontinued",...
                "filters",...
            ];
            request.Body(1).Payload = SearchForDisplayRequest.getPayload(requiredProperties,optionalProperties);

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
                "auth", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("searchEntitiesfordisplayPost", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("searchEntitiesfordisplayPost", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
                    result = macrobond.models.SearchForDisplayResponse(response.Body.Data);
                case 400
                    result = response.Body.Data;
                case 404
                    result = response.Body.Data;
                case 401
                    result = response.Body.Data;
                case 403
                    result = response.Body.Data;
                case 429
                    result = response.Body.Data;
                otherwise % Unexpected output, not declared in spec
                    % Any response in the OK range will not throw a warning
                    if (int32(response.StatusCode) < 200 || int32(response.StatusCode) >= 300)
                        % Others will throw a warning
                        warning("macrobond:api:searchEntitiesfordisplayPost:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","searchEntitiesfordisplayPost",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % searchEntitiesfordisplayPost method

        function [code, result, response] = searchFilterlistsGet(obj, entityType)
            % searchFilterlistsGet Get a list of saved filter lists
            % Get a structured list of all saved filter lists of the specified type. OAuth scope: macrobond_web_api.read_structure or macrobond_web_api.search_mb
            %
            % Required parameters:
            %   entityType - Specify the entity types that the returned lists should contain., Type: string
            %
            % No optional parameters
            %
            % Responses:
            %   200: The operation was successful
            %   400: Request failed
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: Array of ItemListingResponse
            %
            % See Also: macrobond.models.ItemListingResponse

            arguments
              obj macrobond.api.Search
              entityType string
            end

            % Create the request object
            request = matlab.net.http.RequestMessage();
            
            % Verify that operation supports returning JSON
            specAcceptHeaders = [...
                "application/json", ...
            ];
            if ismember("application/json",specAcceptHeaders)
                request.Header(end+1) = matlab.net.http.field.AcceptField('application/json');
            else
                error("macrobond:api:searchFilterlistsGet:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' MediaType.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","searchFilterlistsGet")
            end
            
            % No body input, so no need to check its content type
            
            % No header parameters

            % Configure default httpOptions
            httpOptions = obj.httpOptions;
            % Never convert API response
            httpOptions.ConvertResponse = false;

            % Configure request verb/method
            request.Method = matlab.net.http.RequestMethod('GET');

            % Build the request URI
            if ~isempty(obj.serverUri)
                % If URI specified in object, use that
                uri = obj.serverUri;
            else
                % If no server specified use base path from OpenAPI spec
                uri = matlab.net.URI("https://api.macrobondfinancial.com");
            end
            % Append the operation end-point
            uri.EncodedPath = uri.EncodedPath + "/v1/search/filterlists";

            % No path parameters

            % Set query parameters
            uri.Query(end+1) = matlab.net.QueryParameter("entityType", entityType);
            
            % No JSON body parameters

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
                "auth", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("searchFilterlistsGet", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("searchFilterlistsGet", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
                    result = macrobond.models.ItemListingResponse(response.Body.Data);
                case 400
                    result = response.Body.Data;
                case 401
                    result = response.Body.Data;
                case 403
                    result = response.Body.Data;
                case 429
                    result = response.Body.Data;
                otherwise % Unexpected output, not declared in spec
                    % Any response in the OK range will not throw a warning
                    if (int32(response.StatusCode) < 200 || int32(response.StatusCode) >= 300)
                        % Others will throw a warning
                        warning("macrobond:api:searchFilterlistsGet:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","searchFilterlistsGet",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % searchFilterlistsGet method

    end %methods
end %class


