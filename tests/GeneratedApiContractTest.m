classdef GeneratedApiContractTest < matlab.unittest.TestCase
    % Contract tests for representative generated API operations.

    properties
        ConfigFile string
    end

    methods (TestClassSetup)
        function configureMockClient(testCase)
            mockServerUrl = string(getenv("OPENAPI_MOCK_URL"));
            testCase.assumeGreaterThan(strlength(mockServerUrl), 0, ...
                "Set OPENAPI_MOCK_URL to run the OpenAPI contract tests.");

            testCase.ConfigFile = string(tempname) + ".json";
            settings = struct( ...
                serverUri=mockServerUrl, ...
                bearerToken="test-token", ...
                expiresAt=int64(posixtime(datetime("now"))) + int64(3600));
            writelines(jsonencode(settings), testCase.ConfigFile);
            testCase.addTeardown(@() delete(testCase.ConfigFile));
        end
    end

    methods (Test, TestTags = "Contract")
        function searchesEntities(testCase)
            client = macrobond.api.Search(configFile=testCase.ConfigFile);
            filter = macrobond.JSONMapperMap("Region", "US");
            [code, ~, response] = client.searchEntitiesGet(filter);

            verifySuccessfulResponse(testCase, code, response);
        end

        function suggestsSearchTerms(testCase)
            client = macrobond.api.Search(configFile=testCase.ConfigFile);
            [code, ~, response] = client.searchSearchsuggestionsGet("inflation");

            verifySuccessfulResponse(testCase, code, response);
        end

        function fetchesSeriesWithGet(testCase)
            client = macrobond.api.Series(configFile=testCase.ConfigFile);
            [code, ~, response] = client.seriesFetchseriesGet("usgdp");

            verifySuccessfulResponse(testCase, code, response);
        end

        function fetchesSeriesWithPost(testCase)
            client = macrobond.api.Series(configFile=testCase.ConfigFile);
            request = macrobond.models.DateTypeDefinedEntityRequest(name="usgdp");
            [code, ~, response] = client.seriesFetchseriesPost(request);

            verifySuccessfulResponse(testCase, code, response);
        end

        function fetchesUnifiedSeries(testCase)
            client = macrobond.api.Series(configFile=testCase.ConfigFile);
            entry = macrobond.models.UnifiedSeriesEntry(name="usgdp");
            request = macrobond.models.UnifiedSeriesRequest(seriesEntries=entry);
            [code, ~, response] = client.seriesFetchunifiedseriesPost(request);

            verifySuccessfulResponse(testCase, code, response);
        end

        function getsFormattedSeriesInformation(testCase)
            client = macrobond.api.Series(configFile=testCase.ConfigFile);
            [code, ~, response] = client.seriesEntityinfofordisplayGet("usgdp");

            verifySuccessfulResponse(testCase, code, response);
        end

        function getsMetadataAttributes(testCase)
            client = macrobond.api.Metadata(configFile=testCase.ConfigFile);
            [code, ~, response] = client.metadataGetattributeinformationGet("Region");

            verifySuccessfulResponse(testCase, code, response);
        end

        function listsMetadataAttributeValues(testCase)
            client = macrobond.api.Metadata(configFile=testCase.ConfigFile);
            [code, ~, response] = client.metadataListattributevaluesGet("Region");

            verifySuccessfulResponse(testCase, code, response);
        end

        function getsSeriesTreeNodes(testCase)
            client = macrobond.api.SeriesTree(configFile=testCase.ConfigFile);
            [code, ~, response] = client.seriestreeGetnodesGet;

            verifySuccessfulResponse(testCase, code, response);
        end

        function getsSubscriptionListUpdates(testCase)
            client = macrobond.api.SubscriptionList(configFile=testCase.ConfigFile);
            [code, ~, response] = client.subscriptionlistGetupdatesGet(datetime("today"));

            verifySuccessfulResponse(testCase, code, response);
        end

        function getsUpcomingReleases(testCase)
            client = macrobond.api.Release(configFile=testCase.ConfigFile);
            [code, ~, response] = client.releaseUpcomingreleasesGet("usgdp");

            verifySuccessfulResponse(testCase, code, response);
        end
    end
end

function verifySuccessfulResponse(testCase, code, response)
testCase.verifyEqual(int32(code), int32(200));
testCase.verifyEqual(int32(response.StatusCode), int32(200));
end
