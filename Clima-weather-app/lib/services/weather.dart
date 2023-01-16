import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '38188d51e5c1c6a1464cade2bccaee8d';
const unit = 'imperial';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=$unit';
    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=$unit');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 75) {
      return 'It\'s 🍦 time';
    } else if (temp > 60) {
      return 'Time for shorts and 👕';
    } else if (temp < 30) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
