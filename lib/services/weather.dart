import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:audioplayers/audioplayers.dart';

const kapiKey = '7618a7738960fc1a86d05196d926570f';
const kopenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(cityName) async {
    var url = '$kopenWeatherMapURL?q=$cityName&appid=$kapiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$kopenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kapiKey&units=metric');
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  void playAudioForCondition(int condition) {
    
    final player = AudioPlayer();

    if (condition < 300) {
      player.play(AssetSource('bbc_thunder---_nhu0504402.mp3'));
    } else if (condition < 400) {
      player.play(AssetSource('bbc_thunder---_nhu0504402.mp3'));
    } else if (condition < 600) {
      player.play(AssetSource('bbc_heavy-rain_07005210.mp3'));
    } else if (condition < 700) {
      player.play(AssetSource('bbc_forest-atm_nhu0501007.mp3'));
    } else if (condition < 800) {
      player.play(AssetSource('bbc_weather--s_07054121.mp3'));
    } else if (condition == 800) {
      player.play(AssetSource('bbc_weather--s_07054121.mp3'));
    } else if (condition <= 804) {
      player.play(AssetSource('bbc_weather--s_07054121.mp3'));
    } else {
      player.play(AssetSource('bbc_weather--s_07054121.mp3'));
    }
  }
}
