import 'package:flutter/material.dart';
import 'package:weather_zone/screens/city_screen.dart';
import 'package:weather_zone/services/weather.dart';
import 'package:weather_zone/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;
  LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String toDoMessage;
  String weatherIcon;
  String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var weatherData =
                              await weatherModel.getLocationWeather();
                          updateUi(weatherData);
                        },
                        child: Icon(
                          Icons.gps_fixed_outlined,
                          size: 50.0,
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          String typedCityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityScreen()),
                          );

                          if (typedCityName != null) {
                            var weatherData = await weatherModel
                                .getCityWeather(typedCityName);
                            updateUi(weatherData);
                          }
                        },
                        child: Icon(
                          Icons.add_location,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '$toDoMessage in $city',
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // a method to update the Ui depending on the weather data variable we passed from the loading screen
  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        toDoMessage = 'Unable to reach the location of the device';
        city = 'no where! 🤷';
        weatherIcon = 'Error';
        return;
      }
      double temp = weatherData['main']['temp'];
      //test
      print(temp);
      temperature = temp.round();
      //test
      print(temperature);
      var condition = weatherData['weather'][0]['id'];
      //test
      print(condition);
      // we're getting an icon to display it next to the condition  depending on the condition
      weatherIcon = weatherModel.getWeatherIcon(condition);
      // we're getting a message recommendation of the the weather depending on the temp
      toDoMessage = weatherModel.getMessage(temperature);
      city = weatherData['name'];
      print(city);
    });
  }

  @override
  void initState() {
    super.initState();
    // call this method to update the Ui as soon as the screen gets created
    updateUi(widget.locationWeather);
  }
}
