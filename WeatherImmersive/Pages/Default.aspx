﻿<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    
    
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/weather-icons/2.0.9/css/weather-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    
    <link href="../Content/style.css" rel="stylesheet" />
    <!-- Add your JavaScript to the following file -->
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?libraries=places"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/skycons/1396634940/skycons.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Weather Immersive App
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div>
            
        <section id="dailyForecast">
        <div class="container">
        
        <div class="row justify-content-center searchBar">
        <div class="col-10 col-lg-8">
          <input type="text" name="locSearchBox" id="locSearchBox" />
        </div>
        </div>
        
        <div class="row justify-content-around">
        
        <div class="col-10 col-lg-5 tempBox text-center">
          <i class="icon ion-location"></i>
          <p><span class="locName">Your Location Here</span></p>
          <canvas id="weatherIcon" width="100" height="100"></canvas>
          <p class="m0"><span class="weatherCondition">...</span></p>
          <p class="m0"><span class="currentTemp"></span><span class="unit">°C</span></p>
          <p class="feels"><i class="wi wi-barometer"></i> Feels Like: <span class="feelsLike">...</span></p>
          <p class="convertToggle">°C <i class="icon ion-toggle toggleIcon"></i> °F</p>
          <div class="row tempBoxSubInfo">
            <div class="col">
              <p><i class="wi wi-windy"></i>
                Wind Speed: <span class="windSpeed">...</span> km/s
              </p>
            </div>
            <div class="col">
              <p><i class="wi wi-humidity"></i>
                Humidity: <span class="humidity">...</span> %
              </p>
            </div>
          </div>
        </div>
        
        <div class="col-12 col-sm-12 col-md-10 col-lg-7 col-xl-6 dashboard text-center">
        
          <div class="row justify-content-center dashboardDaily">
            <div class="col-3 tempMaxBox">
              <p><i class="icon ion-arrow-graph-up-left"></i><br>
                <span class="tempMax text-left"></span>
              </p>
            </div>
            <div class="col-6 expect text-center">
              <canvas id="expectIcon" width="80" height="80"></canvas> <br />
              <p class="text-center thin">Expect <span class="todaySummary">...</span></p>
            </div>
            <div class="col-3 tempMinBox">
              <p><span class="tempMin text-right"></span><br>
                <i class="icon ion-arrow-graph-down-right"></i>
              </p>
            </div>
          </div>
        
          <div class="row sunTimes justify-content-center">
            <div class="col sunrise">
              <p><i class="wi wi-sunrise"></i> <span class="sunriseTime"></span></p>
            </div>
            <div class="col sunset">
              <p><i class="wi wi-sunset"></i> <span class="sunsetTime"></span></p>
            </div>
            <div class="col">
              <p><i class="wi wi-day-cloudy-high"></i> <span class="cloudCover"></span></p>
            </div>
            <div class="col">
              <p><i class="wi wi-raindrop"></i> <span class="dewPoint"></span></p>
            </div>
          </div>
        
          <div class="row weatherQuote text-center">
            <div class="col">
              <p class="quote">"There is no such thing as bad weather, only different kinds of good weather." -John Ruskin</p>
            </div>
          </div>
        
          <div class="row justify-content-center weeklyButton">
            <div class="col-12 col-md-5  fadeInUp" data--delay="0.8s">
              <a href="#weeklyForecast" class="goToWeek">Weekly Forecast <i class="icon ion-ios-arrow-down"></i></a>
            </div>
          </div>
        
        </div>
        
        </div>
        </div>
    </section>
    
    <section id="weeklyForecast">
        <div class="container">
        <div class="row justify-content-center">
        <div class="col-10 text-center">
          <h3>Next Six Days: <span class="weekDaysSummary"></span></h3>
        </div>
        </div>
        
        <div class="row justify-content-around weekRows">
        <div class="col-10 col-lg-5 dayCard text-center  fadeinup"  data--delay="0.2s">
          <div class="row">
            <div class="col-5 dayIconHighlight">
              <canvas id="weatherIcon1" width="100" height="100"></canvas>
              <div class="dayMaxMin">
                <p><i class="icon ion-arrow-graph-up-left"></i><span class="weekDayTempMax1"></span>°C</p>
                <p><span class="weekDayTempMin1"></span>°C<i class="icon ion-arrow-graph-down-right"></i></p>
              </div>
            </div>
            <div class="col-7 dayInfoHighlight">
              <div class="row">
                <div class="col-12 weekDay">
                  <p class="weekDayName1">Day</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySummary">
                  <p class="weekDaySummary1">Days Info</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySun">
                  <p><i class="wi wi-sunrise"></i> <span class="weekDaySunrise1"></span> AM</p>
                  <p><i class="wi wi-sunset"></i> <span class="weekDaySunset1"></span> PM</p>
                </div>
              </div>
              <div class="row">
                <div class="col weekDayWindnHumidity">
                  <p><i class="wi wi-windy"></i> <span class="weekDayWind1"></span> km/s</p>
                  <p><i class="wi wi-humidity"></i> <span class="weekDayHumid1"></span>%</p>
                  <p><i class="wi wi-day-cloudy-high"></i> <span class="weekDayCloud1"></span>%</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-10 col-lg-5 dayCard text-center  fadeInUp" data--delay="0.4s">
          <div class="row">
            <div class="col-5 dayIconHighlight">
              <canvas id="weatherIcon2" width="100" height="100"></canvas>
              <div class="dayMaxMin">
                <p><i class="icon ion-arrow-graph-up-left"></i><span class="weekDayTempMax2"></span>°C</p>
                <p><span class="weekDayTempMin2"></span>°C<i class="icon ion-arrow-graph-down-right"></i></p>
              </div>
            </div>
            <div class="col-7 dayInfoHighlight">
              <div class="row">
                <div class="col-12 weekDay">
                  <p class="weekDayName2">Day</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySummary">
                  <p class="weekDaySummary2">Days Info</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySun">
                  <p><i class="wi wi-sunrise"></i> <span class="weekDaySunrise2"></span> AM</p>
                  <p><i class="wi wi-sunset"></i> <span class="weekDaySunset2"></span> PM</p>
                </div>
              </div>
              <div class="row">
                <div class="col weekDayWindnHumidity">
                  <p><i class="wi wi-windy"></i> <span class="weekDayWind2"></span> km/s</p>
                  <p><i class="wi wi-humidity"></i> <span class="weekDayHumid2"></span>%</p>
                  <p><i class="wi wi-day-cloudy-high"></i> <span class="weekDayCloud2"></span>%</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        
        <div class="row justify-content-around weekRows">
        <div class="col-10 col-lg-5 dayCard text-center  fadeInUp" data--delay="0.2s">
          <div class="row">
            <div class="col-5 dayIconHighlight">
              <canvas id="weatherIcon3" width="100" height="100"></canvas>
              <div class="dayMaxMin">
                <p><i class="icon ion-arrow-graph-up-left"></i><span class="weekDayTempMax3"></span>°C</p>
                <p><span class="weekDayTempMin3"></span>°C<i class="icon ion-arrow-graph-down-right"></i></p>
              </div>
            </div>
            <div class="col-7 dayInfoHighlight">
              <div class="row">
                <div class="col-12 weekDay">
                  <p class="weekDayName3">Day</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySummary">
                  <p class="weekDaySummary3">Days Info</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySun">
                  <p><i class="wi wi-sunrise"></i> <span class="weekDaySunrise3"></span> AM</p>
                  <p><i class="wi wi-sunset"></i> <span class="weekDaySunset3"></span> PM</p>
                </div>
              </div>
              <div class="row">
                <div class="col weekDayWindnHumidity">
                  <p><i class="wi wi-windy"></i> <span class="weekDayWind3"></span> km/s</p>
                  <p><i class="wi wi-humidity"></i> <span class="weekDayHumid3"></span>%</p>
                  <p><i class="wi wi-day-cloudy-high"></i> <span class="weekDayCloud3"></span>%</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-10 col-lg-5 dayCard text-center  fadeInUp"  data--delay="0.4s">
          <div class="row">
            <div class="col-5 dayIconHighlight">
              <canvas id="weatherIcon4" width="100" height="100"></canvas>
              <div class="dayMaxMin">
                <p><i class="icon ion-arrow-graph-up-left"></i><span class="weekDayTempMax4"></span>°C</p>
                <p><span class="weekDayTempMax4"></span>°C<i class="icon ion-arrow-graph-down-right"></i></p>
              </div>
            </div>
            <div class="col-7 dayInfoHighlight">
              <div class="row">
                <div class="col-12 weekDay">
                  <p class="weekDayName4">Day</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySummary">
                  <p class="weekDaySummary4">Days Info</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySun">
                  <p><i class="wi wi-sunrise"></i> <span class="weekDaySunrise4"></span> AM</p>
                  <p><i class="wi wi-sunset"></i> <span class="weekDaySunset4"></span> PM</p>
                </div>
              </div>
              <div class="row">
                <div class="col weekDayWindnHumidity">
                  <p><i class="wi wi-windy"></i> <span class="weekDayWind4"></span> km/s</p>
                  <p><i class="wi wi-humidity"></i> <span class="weekDayHumid4"></span>%</p>
                  <p><i class="wi wi-day-cloudy-high"></i> <span class="weekDayCloud4"></span>%</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        
        <div class="row justify-content-around weekRows">
        <div class="col-10 col-lg-5 dayCard text-center  fadeInUp" data--delay="0.2s">
          <div class="row">
            <div class="col-5 dayIconHighlight">
              <canvas id="weatherIcon5" width="100" height="100"></canvas>
              <div class="dayMaxMin">
                <p><i class="icon ion-arrow-graph-up-left"></i><span class="weekDayTempMax5"></span>°C</p>
                <p><span class="weekDayTempMax5"></span>°C<i class="icon ion-arrow-graph-down-right"></i></p>
              </div>
            </div>
            <div class="col-7 dayInfoHighlight">
              <div class="row">
                <div class="col-12 weekDay">
                  <p class="weekDayName5">Day</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySummary">
                  <p class="weekDaySummary5">Days Info</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySun">
                  <p><i class="wi wi-sunrise"></i> <span class="weekDaySunrise5"></span> AM</p>
                  <p><i class="wi wi-sunset"></i> <span class="weekDaySunset5"></span> PM</p>
                </div>
              </div>
              <div class="row">
                <div class="col weekDayWindnHumidity">
                  <p><i class="wi wi-windy"></i> <span class="weekDayWind5"></span> km/s</p>
                  <p><i class="wi wi-humidity"></i> <span class="weekDayHumid5"></span>%</p>
                  <p><i class="wi wi-day-cloudy-high"></i> <span class="weekDayCloud5"></span>%</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-10 col-lg-5 dayCard text-center  fadeInUp"  data--delay="0.4s">
          <div class="row">
            <div class="col-5 dayIconHighlight">
              <canvas id="weatherIcon6" width="100" height="100"></canvas>
              <div class="dayMaxMin">
                <p><i class="icon ion-arrow-graph-up-left"></i><span class="weekDayTempMax6"></span>°C</p>
                <p><span class="weekDayTempMax6"></span>°C<i class="icon ion-arrow-graph-down-right"></i></p>
              </div>
            </div>
            <div class="col-7 dayInfoHighlight">
              <div class="row">
                <div class="col-12 weekDay">
                  <p class="weekDayName6">Day</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySummary">
                  <p class="weekDaySummary6">Days Info</p>
                </div>
              </div>
              <div class="row">
                <div class="col-12 weekDaySun">
                  <p><i class="wi wi-sunrise"></i> <span class="weekDaySunrise6"></span> AM</p>
                  <p><i class="wi wi-sunset"></i> <span class="weekDaySunset6"></span> PM</p>
                </div>
              </div>
              <div class="row">
                <div class="col weekDayWindnHumidity">
                  <p><i class="wi wi-windy"></i> <span class="weekDayWind6"></span> km/s</p>
                  <p><i class="wi wi-humidity"></i> <span class="weekDayHumid6"></span>%</p>
                  <p><i class="wi wi-day-cloudy-high"></i> <span class="weekDayCloud6"></span>%</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        </div>
        </section>  
        <center>
        
     
        <div id="chartContainer" style="height: 225px; width:54%;"></div>
        <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
        <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
        </center>
        <section id="footer">
        <p class="love">Powered by DarkSkies. Made by The Good, The Bad and The Ugly.</p>
        </section>
    </div>

</asp:Content>
