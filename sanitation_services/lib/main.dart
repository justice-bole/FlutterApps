import 'package:flutter/material.dart';
import 'package:sanitation_services/screens/info_screen.dart';
import 'package:sanitation_services/screens/welcome_screen.dart';

void main() {
  runApp(const Sanitation());
}

class Sanitation extends StatelessWidget {
  const Sanitation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/info_screen': (context) => InfoScreen(),
      },
    );
  }
}
