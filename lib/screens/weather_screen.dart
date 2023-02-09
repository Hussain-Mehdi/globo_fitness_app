import 'package:flutter/material.dart';

import '../data/http_helper.dart';
import '../data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  TextEditingController cityNametxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: cityNametxt,
                decoration: InputDecoration(
                    hintText: "Enter a city",
                    suffixIcon: IconButton(
                        onPressed: getData, icon: const Icon(Icons.search))),
              ),
            ),
            weatherRow("Place ", result.name),
            weatherRow("Desciption ", result.description),
            weatherRow("Temprature ", result.temprature.toStringAsFixed(2)),
            weatherRow("Perceive ", result.perceived.toString()),
            weatherRow("Pressure ", result.pressure.toString()),
            weatherRow("Humidity ", result.humidity.toString()),
          ],
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();

    result = await helper.getWeather(cityNametxt.text);

    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              )),
        ],
      ),
    );
    return row;
  }
}
