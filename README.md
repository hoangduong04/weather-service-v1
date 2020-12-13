![](RackMultipart20201212-4-1apcq22_html_a5731bced2122b73.gif) ![](RackMultipart20201212-4-1apcq22_html_c779f97c99a89577.gif)

# WEATHER SERVICE

API Specification - V1.0

Daniel Nguyen

# Table of Contents

### 1.OVERVIEW

#### 1.1.Scope

#### 1.2.Interfaces and dependencies on other systems

### 2.SERVICE DETAILS

#### 2.1.Interface

#### 2.2.Available endpoints

##### 2.2.1./countries/{country}/cities

##### 2.2.2./countries/{country}/cities/{city}/weather


---

### 1.OVERVIEW

#### 1.1.Scope

The Weather Service provides real-time weather information based on location. It is intended to expose the GlobalWeather SOAP webservice currently provided by Webservicex ([http://www.webservicex.com/globalweather.asmx?WSDL](http://www.webservicex.com/globalweather.asmx?WSDL)) and its existing services, including **/GetWeather** and **/GetCitiesByCountry**.

#### 1.2.Interfaces and dependencies on other systems

The Weather Service relies on the availability of the GlobalWeather service and produces responses based on the data provided by GlobalWeather.

---

### 2.SERVICE DETAILS

#### 2.1.Interface

|                     |                                                     |
|---------------------|-----------------------------------------------------|
| **Service Name**    | Weather Service                                     |
| **Service Version** | v1.0                                                |
| **Base URL**        | http://localhost:8082/{version}/weather-service |
| **Method Name**     | GET                                                 |

#### 2.2.Available endpoints

##### 2.2.1. /countries/{country}/cities

Returns the names of all cities within the country

##### 2.2.2. /countries/{country}/cities/{city}/weather
Returns the current weather of the specified city
