classdef MacrobondClientTest < matlab.unittest.TestCase
    % Tests for the high-level Macrobond client facade.

    methods (Test)
        function constructsAllExposedApiClients(testCase)
            client = MacrobondClient;

            testCase.verifyClass(client.InHouseSeries, "macrobond.api.InHouseSeries");
            testCase.verifyClass(client.Metadata, "macrobond.api.Metadata");
            testCase.verifyClass(client.Release, "macrobond.api.Release");
            testCase.verifyClass(client.Search, "macrobond.api.Search");
            testCase.verifyClass(client.Series, "macrobond.api.Series");
            testCase.verifyClass(client.SeriesTree, "macrobond.api.SeriesTree");
            testCase.verifyClass(client.SubscriptionList, "macrobond.api.SubscriptionList");
        end

        function constructsWithSpecifiedScopes(testCase)
            scopes = "macrobond_web_api.read_mb";
            client = MacrobondClient(scopes=scopes);

            testCase.verifyClass(client.InHouseSeries, "macrobond.api.InHouseSeries");
            testCase.verifyClass(client.Metadata, "macrobond.api.Metadata");
            testCase.verifyClass(client.Release, "macrobond.api.Release");
            testCase.verifyClass(client.Search, "macrobond.api.Search");
            testCase.verifyClass(client.Series, "macrobond.api.Series");
            testCase.verifyClass(client.SeriesTree, "macrobond.api.SeriesTree");
            testCase.verifyClass(client.SubscriptionList, "macrobond.api.SubscriptionList");
        end
    end
end
