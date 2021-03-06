import 'package:weather_zone/services/location.dart';
import 'package:weather_zone/services/networking.dart';
import 'package:weather_zone/utilities/constants.dart';

class WeatherModel {
  // getting the weather condition according to the city the user typed in
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenWeatherUrl?q=$cityName&appid=$kAppId&&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
    // create a new route to go to the location screen once we get the weather data
  }

  // getting the weather condition according to the use's location
  Future<dynamic> getLocationWeather() async {
    LocationGetter _locationGetter = LocationGetter();
    await _locationGetter.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenWeatherUrl?lat=${_locationGetter.latitude}&lon=${_locationGetter.longitude}&appid=$kAppId&&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s ๐ time';
    } else if (temp > 23) {
      return 'Time for shorts and ๐ฆ ';
    } else if (temp > 15 && temp <= 23) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
