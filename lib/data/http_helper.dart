import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather.dart';

class HttpHelper {
//https://api.openweathermap.org
//this is link to get your apikey.

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final apiKey = 'write your apikey here';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameter = {'q': location, 'appId': apiKey};

    Uri uri = Uri.https(authority, path, parameter);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);

    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
