class Weather {
  String name = '';
  String description = '';
  double temprature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temprature, this.perceived,
      this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    temprature = (weatherMap['main']['temp'] - 273.15 ?? 0);
    perceived = (weatherMap['main']['feels_like'] ?? 0);
    pressure = weatherMap['main']['pressure'] ?? 0;
    humidity = weatherMap['main']['humidity'] ?? 0;
    description = weatherMap['weather'][0]['main'] ?? '';
  }
}
