classdef InHouseSeries < macrobond.BaseClient
    % InHouseSeries No description provided
    %
    % InHouseSeries Properties:
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
    % InHouseSeries Methods:
    %
    %   InHouseSeries - Constructor
    %   seriesDeleteseriesDelete - Delete an in-house time series
    %   seriesUploadseriesPost - Upload an in-house time series
    %   seriestreeGetseriesstoragelocationsGet - Get list of locations where in-house series can be stored
    %   seriestreeGetusedinhousecategoriesGet - Get a list of used in-house categories
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
        function obj = InHouseSeries(options)
            % InHouseSeries Constructor, creates a InHouseSeries instance.
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
            %   client = macrobond.api.InHouseSeries();
            %
            %   % Create a client for alternative server/base URI
            %   client = macrobond.api.InHouseSeries("serverUri","https://example.com:1234/api/");
            %
            %   % Create a client loading configuration options from 
            %   % JSON configuration file
            %   client = macrobond.api.InHouseSeries("configFile","myconfig.json");
            %
            %   % Create a client with alternative HTTPOptions and an API key
            %   client = macrobond.api.InHouseSeries("httpOptions",...
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

        function [code, result, response] = seriesDeleteseriesDelete(obj, optionals)
            % seriesDeleteseriesDelete Delete an in-house time series
            % Delete an in-house time series. The name typically starts with ''ih:mb:''. OAuth scope: macrobond_web_api.write_ih
            %
            % No required parameters
            %
            % Optional name-value parameters:
            %   n - No description provided, Type: string
            %
            % Responses:
            %   200: The operation was successful
            %   404: The series could not be found
            %   400: The operation failed
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: 
            %
            % See Also: macrobond.models.

            arguments
              obj macrobond.api.InHouseSeries
              optionals.n string
            end

            % Create the request object
            request = matlab.net.http.RequestMessage();
            
            % No return content type specified, defaulting to JSON
            request.Header(end+1) = matlab.net.http.field.AcceptField('application/json');
            
            % No body input, so no need to check its content type
            
            % No header parameters

            % Configure default httpOptions
            httpOptions = obj.httpOptions;
            % Never convert API response
            httpOptions.ConvertResponse = false;

            % Configure request verb/method
            request.Method = matlab.net.http.RequestMethod('DELETE');

            % Build the request URI
            if ~isempty(obj.serverUri)
                % If URI specified in object, use that
                uri = obj.serverUri;
            else
                % If no server specified use base path from OpenAPI spec
                uri = matlab.net.URI("https://api.macrobondfinancial.com");
            end
            % Append the operation end-point
            uri.EncodedPath = uri.EncodedPath + "/v1/series/deleteseries";

            % No path parameters

            % Set query parameters
            if isfield(optionals, "n"), uri.Query(end+1) = matlab.net.QueryParameter("n", optionals.n); end
            
            % No JSON body parameters

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("seriesDeleteseriesDelete", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("seriesDeleteseriesDelete", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
                    result = response.Body.Data;
                case 404
                    result = response.Body.Data;
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
                        warning("macrobond:api:seriesDeleteseriesDelete:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","seriesDeleteseriesDelete",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % seriesDeleteseriesDelete method

        function [code, result, response] = seriesUploadseriesPost(obj, SeriesRequest)
            % seriesUploadseriesPost Upload an in-house time series
            % Upload an in-house time series. In the metadata, PrimName, Frequency, IHCategory, Region and Description must be set. If no vector of dates is specified, the StartDate must be included in the metadata. For daily series, DayMask must also be included. OAuth scope: macrobond_web_api.write_ih
            %
            % Required parameters:
            %   SeriesRequest - The series data to upload, Type: SeriesRequest
            %       Required properties in the model for this call:
            %       Optional properties in the model for this call:
            %           values
            %           dates
            %           forecastFlags
            %           metadata
            %           metadataBaseSeries
            %
            % No optional parameters
            %
            % Responses:
            %   200: The operation was successful
            %   400: The operation failed
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: 
            %
            % See Also: macrobond.models.

            arguments
              obj macrobond.api.InHouseSeries
              SeriesRequest macrobond.models.SeriesRequest
            end

            % Create the request object
            request = matlab.net.http.RequestMessage();
            
            % No return content type specified, defaulting to JSON
            request.Header(end+1) = matlab.net.http.field.AcceptField('application/json');
            
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
                error("macrobond:api:seriesUploadseriesPost:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' and 'application/x-www-form-urlencoded' MediaTypes.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","seriesUploadseriesPost")
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
            uri.EncodedPath = uri.EncodedPath + "/v1/series/uploadseries";

            % No path parameters

            % No query parameters
            
            % Set JSON Body
            requiredProperties = [...
            ];
            optionalProperties = [...
                "values",...
                "dates",...
                "forecastFlags",...
                "metadata",...
                "metadataBaseSeries",...
            ];
            request.Body(1).Payload = SeriesRequest.getPayload(requiredProperties,optionalProperties);

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("seriesUploadseriesPost", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("seriesUploadseriesPost", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
                    result = response.Body.Data;
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
                        warning("macrobond:api:seriesUploadseriesPost:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","seriesUploadseriesPost",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % seriesUploadseriesPost method

        function [code, result, response] = seriestreeGetseriesstoragelocationsGet(obj)
            % seriestreeGetseriesstoragelocationsGet Get list of locations where in-house series can be stored
            % Get a list of locations where in-house series can be stored. OAuth scope: macrobond_web_api.read_structure and macrobond_web_api.write_ih
            %
            % No required parameters
            %
            % No optional parameters
            %
            % Responses:
            %   200: The operation was successful
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: Array of SeriesStorageLocationResponse
            %
            % See Also: macrobond.models.SeriesStorageLocationResponse

            arguments
              obj macrobond.api.InHouseSeries
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
                error("macrobond:api:seriestreeGetseriesstoragelocationsGet:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' MediaType.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","seriestreeGetseriesstoragelocationsGet")
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
            uri.EncodedPath = uri.EncodedPath + "/v1/seriestree/getseriesstoragelocations";

            % No path parameters

            % No query parameters
            
            % No JSON body parameters

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("seriestreeGetseriesstoragelocationsGet", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("seriestreeGetseriesstoragelocationsGet", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
                    result = macrobond.models.SeriesStorageLocationResponse(response.Body.Data);
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
                        warning("macrobond:api:seriestreeGetseriesstoragelocationsGet:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","seriestreeGetseriesstoragelocationsGet",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % seriestreeGetseriesstoragelocationsGet method

        function [code, result, response] = seriestreeGetusedinhousecategoriesGet(obj)
            % seriestreeGetusedinhousecategoriesGet Get a list of used in-house categories
            % Get a list of values of the IHCategory attribute that has previously been used. This can be used to suggest values to the user when creating in-house series. OAuth scope: macrobond_web_api.read_structure and macrobond_web_api.write_ih
            %
            % No required parameters
            %
            % No optional parameters
            %
            % Responses:
            %   200: The operation was successful
            %   401: Unauthorized. Missing, invalid or expired access token.
            %   403: Forbidden. Not authorized.
            %   429: Too many requests. The maximum number of requests per day has been reached.
            %
            % Returns: Array of string
            %
            % See Also: macrobond.models.string

            arguments
              obj macrobond.api.InHouseSeries
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
                error("macrobond:api:seriestreeGetusedinhousecategoriesGet:UnsupportedMediaType","Generated OpenAPI Classes only support 'application/json' MediaType.\n" + ...
                    "Operation '%s' does not support this. It may be possible to call this operation by first editing the generated code.","seriestreeGetusedinhousecategoriesGet")
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
            uri.EncodedPath = uri.EncodedPath + "/v1/seriestree/getusedinhousecategories";

            % No path parameters

            % No query parameters
            
            % No JSON body parameters

            % No form body parameters

            % Configure Authentication
            authNames = [...
                "ClientDirectAccess", ...
            ];  
            [request, httpOptions, uri] = obj.requestAuth(authNames, request, httpOptions, uri);

            % Add cookies if set
            request = obj.applyCookies(request, uri);

            % Call preSend
            [request, httpOptions, uri] = obj.preSend("seriestreeGetusedinhousecategoriesGet", request, httpOptions, uri);

            % Perform the request
            [response, ~, history] = send(request, uri, httpOptions);

            % Handle cookies if set
            obj.setCookies(history);

            % Call postSend
            response = obj.postSend("seriestreeGetusedinhousecategoriesGet", response, request, uri, httpOptions);

            % Handle response
            code = response.StatusCode;
            switch (code)
                case 200
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
                        warning("macrobond:api:seriestreeGetusedinhousecategoriesGet:UndocumentedResponse","Operation '%s' returned an undocumented response code '%d'.\n" + ...
                            "Response Body is returned as raw data.","seriestreeGetusedinhousecategoriesGet",code);
                    end
                    % Return the raw body data
                    result = response.Body.Data;
            end
        
        end % seriestreeGetusedinhousecategoriesGet method

    end %methods
end %class


