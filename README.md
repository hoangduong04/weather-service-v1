![](RackMultipart20201212-4-1apcq22_html_a5731bced2122b73.gif) ![](RackMultipart20201212-4-1apcq22_html_c779f97c99a89577.gif)

# WEATHER SERVICE

API Specification - V1.0

Daniel Nguyen

# Table of Contents

[DOCUMENT DETAILS 2](#_Toc58703284)

[1.OVERVIEW 3](#_Toc58703285)

[1.1.Scope 3](#_Toc58703286)

[1.2.Interfaces and dependencies on other systems 3](#_Toc58703287)

[2.Service details 3](#_Toc58703288)

[2.1.Interface 3](#_Toc58703289)

[INTERFACE 3](#_Toc58703290)

[2.2.Available endpoints 3](#_Toc58703291)

[2.2.1./countries/{country}/cities 3](#_Toc58703292)

[2.2.2./countries/{country}/cities/{city}/weather 4](#_Toc58703300)

[3.Design &amp; Implementation 6](#_Toc58703308)

[3.1.Design approach 6](#_Toc58703309)

[3.2.Implementation 6](#_Toc58703310)

|
### **DOCUMENT DETAILS**
 |
| --- |
| **Document Revision** | V1 |
| **Date** | 12/12/2020 |
| **Author** | Daniel Nguyen |

1.
# OVERVIEW

  1.
## Scope

The Weather Service provides real-time weather information based on location. It is intended to expose the GlobalWeather SOAP webservice currently provided by Webservicex ([http://www.webservicex.com/globalweather.asmx?WSDL](http://www.webservicex.com/globalweather.asmx?WSDL)) and its existing services, including **/GetWeather** and **/GetCitiesByCountry**.

  1.
## Interfaces and dependencies on other systems

The Weather Service relies on the availability of the GlobalWeather service and produces responses based on the data provided by GlobalWeather.

1.
# Service details

  1.
## Interface

|
### **INTERFACE**
 |
| --- |
| **Service Name** | Weather Service |
| **Service Version** | v1.0 |
| **Base URL** | [http://localhost:8082/{version}/weather-service](http://localhost:8082/%7Bversion%7D/weather-service) |
| **Operation Name** | GET |

  1.
## Available endpoints

    1.
### /countries/{country}/cities

Returns the names of all cities within the country

**Input:**

|
### Input URI Params
 |
### Description
 |
### Data Types
 |
| --- | --- | --- |
| **country** | Name of the country to be requested | string |

**Output:**

|
### Fields
 |
### Description
 |
### Data Types
 |
### Source Field (GlobalWeather)
 |
| --- | --- | --- | --- |
| **country** | Name of the country | string | GetCitiesByCountryResponse/NewDataSet/Table/Country |
| **city** | Name of the city | string | GetCitiesByCountryResponse/NewDataSet/Table/City |

**Example response:**

[

    {

        &quot;country&quot;: &quot;Australia&quot;,

        &quot;city&quot;: &quot;Archerfield Aerodrome&quot;

    },

    {

        &quot;country&quot;: &quot;Australia&quot;,

        &quot;city&quot;: &quot;Amberley Aerodrome&quot;

    },

    ...

]

    1.
### /countries/{country}/cities/{city}/weather

Returns the current weather of the specified city

**Input:**

|
### Input URI Params
 |
### Description
 |
### Data Types
 |
| --- | --- | --- |
| **country** | Name of the country to be requested | string |
| **city** | Name of the city to be requested | string |

**Output:**

|
### Fields
 |
### Description
 |
### Data Types
 |
### Source Field (GlobalWeather)
 |
| --- | --- | --- | --- |
| **Location** | Name of the city | string | GetWeatherResponse/NewDataSet/Location |
| --- | --- | --- | --- |
| **Time** | Current time | time | GetWeatherResponse/NewDataSet/Time |
| **Wind** | Wind speed | string | GetWeatherResponse/NewDataSet/Wind |
| **Visibility** | Distance visible | string | GetWeatherResponse/NewDataSet/Visibility |
| **SkyConditions** | Sky condition (i.e. rain, sunny) | string | GetWeatherResponse/NewDataSet/SkyConditions |
| **Temperature** | Temperature | string | GetWeatherResponse/NewDataSet/Temperature |
| **DewPoint** | Temperature of the air need to achieve relative humidity of 100% | string | GetWeatherResponse/NewDataSet/DewPoint |
| **RelativeHumidity** | Relative humidity (RH) | string | GetWeatherResponse/NewDataSet/RelativeHumidity |
| **Status** | Status | string | GetWeatherResponse/NewDataSet/Status |

**Example response:**

{

    &quot;Location&quot;: &quot;Melbourne&quot;,

    &quot;Time&quot;: &quot;11 AM&quot;,

    &quot;Wind&quot;: &quot;15 km per hour&quot;,

    &quot;Visibility&quot;: &quot;10 km&quot;,

    &quot;SkyConditions&quot;: &quot;sunny&quot;,

    &quot;Temperature&quot;: &quot;18&quot;,

    &quot;DewPoint&quot;: &quot;2 C&quot;,

    &quot;RelativeHumidity&quot;: &quot;35&quot;,

    &quot;Status&quot;: &quot;Normal&quot;

}

1.
# Design &amp; Implementation

  1.
## Design approach

The Weather Service is designed according to the Request-Response pattern. The structure of the design is as follows:

![](RackMultipart20201212-4-1apcq22_html_cbae028b8c2b0c95.png)

  1.
## Implementation

The sequence of interactions between the Consumer, Weather Service and GlobalWeather service is demonstrated in the following paragraph:

![](RackMultipart20201212-4-1apcq22_html_1d8e73443a4c2c7.png)