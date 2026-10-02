classdef MacrobondClient

    properties (Access = private)
        Scopes (:,1) string
    end

    properties (SetAccess = private)
        InHouseSeries
        Metadata
        Release
        Search
        Series
        SeriesTree
        SubscriptionList
    end

    methods

        function obj = MacrobondClient(nvp, options)

            arguments
                nvp.scopes (:,1) string = [...
                    "macrobond_web_api.read_mb",... % Read entities from the Macrobond database
                    "macrobond_web_api.search_mb",... % Search in the Macrobond database
                    "macrobond_web_api.read_structure",... % Read database structure like the database tree
                    "macrobond_web_api.write_ih",... % Create and update in-house time series
                    ];
                options.?macrobond.BaseClient
            end
            args = namedargs2cell(options);
            obj.Scopes = nvp.scopes;

            obj.InHouseSeries = macrobond.api.InHouseSeries(args{:}, scopes = obj.Scopes);
            obj.Metadata = macrobond.api.Metadata(args{:}, scopes = obj.Scopes);
            obj.Release = macrobond.api.Release(args{:}, scopes = obj.Scopes);
            obj.Search = macrobond.api.Search(args{:}, scopes = obj.Scopes);
            obj.Series = macrobond.api.Series(args{:}, scopes = obj.Scopes);
            obj.SeriesTree = macrobond.api.SeriesTree(args{:}, scopes = obj.Scopes);
            obj.SubscriptionList = macrobond.api.SubscriptionList(args{:}, scopes = obj.Scopes);

        end

    end

end