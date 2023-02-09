import 'package:flutter/material.dart';

import '../shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  final double fontsize = 18;
  late List<bool> isSelected;

  TextEditingController heightTxt = TextEditingController();
  TextEditingController weightTxt = TextEditingController();

  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        "Please insert your height in ${(isMetric) ? 'meters' : 'inches'}";
    weightMessage =
        "Please insert your weight in ${(isMetric) ? 'Kilos' : 'Pounds'}";
    return Scaffold(
        bottomNavigationBar: const MenuBottom(),
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ToggleButtons(
                  isSelected: isSelected,
                  onPressed: toggleMeasure,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Matric",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Imperial",
                        style: TextStyle(fontSize: fontsize),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: heightTxt,
                  decoration: InputDecoration(
                    hintText: heightMessage,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: weightTxt,
                  decoration: InputDecoration(
                    hintText: weightMessage,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                    onPressed: () => findBMI(),
                    child: const Text("Calulate BMI")),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(result),
              )
            ],
          ),
        ));
  }

  void toggleMeasure(index) {
    if (index == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(heightTxt.text) ?? 0;
    double weight = double.tryParse(weightTxt.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = bmi.toStringAsFixed(2);
    });
  }
}
