classdef ResponseErrorCode < macrobond.JSONEnum
% ResponseErrorCode   206 = PartialContent (The operation was successful, but only new revisions are included)  304 = NotModified (The item was not modified and is not included in the response)  403 = Forbidden (Access to the item was denied)  404 = NotFound (The item was not found)  500 = Other (There was an error and it is described in the error text)

    % This file is automatically generated using OpenAPI
    % Specification version: v1
    % MATLAB Generator for OpenAPI version: 1.0.0
    

    properties  (Constant)
        baseType = "int32"
    end

    enumeration 
        PartialContent (int32(206))
        NotModified (int32(304))
        Forbidden (int32(403))
        NotFound (int32(404))
        Other (int32(500))
    end

end %class

