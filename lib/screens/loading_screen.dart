import 'package:flutter/material.dart';
import 'package:weather_zone/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_zone/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 140.0,
        ),
      ),
    );
  }

  void getLocationData() async {
    // get the weather of the user's location
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    print(weatherData);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        // we'r passing the weather data of that location to the 'LocationScreen()'
        builder: (context) => LocationScreen(weatherData),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
