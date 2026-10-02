# Macrobond Data API for MATLAB

This toolbox provides a MATLAB interface to the
[Macrobond Data API](https://help.macrobond.com/technical-information/the-macrobond-data-web-api-feed/).
The generated client is refreshed from Macrobond's published
[OpenAPI specification](https://api.macrobondfinancial.com/swagger/v1/swagger.json).

## Install

Install the latest toolbox release with MATLAB Package Manager in R2026b
or newer:

```matlab
mpminstall("https://github.com/ebenetce/MACROBOND-Data-API-for-MATLAB/releases/latest/download/Macrobond.mltbx")
```

For R2026a or older, download the release asset and install it as an
add-on:

```matlab
url = "https://github.com/ebenetce/MACROBOND-Data-API-for-MATLAB/releases/latest/download/Macrobond.mltbx";
file = websave(fullfile(tempdir,"Macrobond.mltbx"),url);
matlab.addons.install(file)
```

## Quick start

Create a client, then request a series by its Macrobond name:

```matlab
mc = MacrobondClient;
[code, data] = mc.Series.seriesFetchseriesGet("usgdp");
```

On the first request, the client obtains a Macrobond access token. Supply
only the scopes needed by your application when creating the client:

```matlab
mc = MacrobondClient(scopes="macrobond_web_api.read_mb");
```

For more complex requests, create the corresponding model object:

```matlab
request = macrobond.models.DateTypeDefinedEntityRequest(name="usgdp");
[code, data] = mc.Series.seriesFetchseriesPost(request);
```

## API reference

The client is generated from the Macrobond OpenAPI specification, so some
operation names closely follow the HTTP endpoints. Use MATLAB help for a
generated operation:

```matlab
help macrobond.api.Series.seriesFetchseriesPost
```

See the [Macrobond Web API documentation](https://api.macrobondfinancial.com/swagger/index.html)
for the complete service reference.

