import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class WeatherModel {

  Future<Position?> getLocation() async{
    return await Location().getCurrentLocation();
  }
  
  Future<dynamic> getCityWeather(String cityName) async{
    var url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      query: 'q=$cityName&appid=7aebb657fee46a9752f83fd11f6368b8&units=metric'
    );
    var networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }
  Future<dynamic> getWeatherData() async{
    var position = await getLocation();
    if(position == null)
    {
      return getCityWeather('Cairo');
    }
    var url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      query: 'lat=${position.latitude}&lon=${position.longitude}&appid=7aebb657fee46a9752f83fd11f6368b8&units=metric'
    );

    var networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getWeatherData();
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
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
