import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kAppId = '731efba6bd4c37d793a105d47e927b63';
const kOpenWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kTextFieldInputDecoration = InputDecoration(
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 30.0,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a City Name.',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
