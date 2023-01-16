import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationData;
  LocationScreen(this.locationData);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  double temperature;
  int condition;
  String cityName;

  int temp;
  String weatherIcon;
  String weatherDescription;

  @override
  void initState() {
    upadateUI(widget.locationData);

    super.initState();
  }

  void upadateUI(dynamic decodedData) {
    setState(() {
      if (decodedData == null) {
        temperature = 0;
        condition = 0;
        cityName = 'Location unavailable.';
        return;
      }
      temperature = decodedData['main']['temp'];
      condition = decodedData['weather'][0]['id'];
      cityName = decodedData['name'];

      temp = temperature.round();
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherDescription = weatherModel.getMessage(temp);
    });
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        weatherModel.getWeatherData();
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.location_city,
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
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherDescription in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
