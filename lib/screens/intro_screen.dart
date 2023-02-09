import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';
import '/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Globo Fitness"),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./images/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Container(
          padding: const EdgeInsets.all(59.0),
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(5.0)),
          child: const Text(
            "Commit to be fit, dare to be \ngreat with Fitness",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 16.0,
                shadows: [
                  Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.grey)
                ]),
          ),
        )),
      ),
    );
  }
}
