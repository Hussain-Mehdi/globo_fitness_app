import 'package:flutter/material.dart';

import 'screens/bmi_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/session_screen.dart';

void main() {
  runApp(const Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fitness",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
        '/training': (context) => const SessionScreen()
      },
    );
  }
}
