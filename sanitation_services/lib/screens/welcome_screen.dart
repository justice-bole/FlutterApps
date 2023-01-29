import 'package:flutter/material.dart';
import '../constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(8.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                color: green,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Ready, Set, Wash!',
                    style: GoogleFontsTextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.delete_outline,
                color: green,
                size: iconSize,
              ),
              Icon(
                Icons.cleaning_services,
                color: orange,
                size: iconSize,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.water_drop_outlined,
                color: orange,
                size: iconSize,
              ),
              Icon(
                Icons.air_outlined,
                color: green,
                size: iconSize,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(8.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  color: green,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.lightbulb,
                          color: Colors.white,
                        ),
                        Text(
                          'Did You Know?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Dirty trash cans emit airborne fungal and bacterial species that can cause inflamation and alleriges?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                left: 30,
                top: 22,
                bottom: 22,
                right: 30,
              ),
              child: const Text(
                'Don\'t get your hands dirty getting your cans clean.',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
          ),
          Container(
            width: 370,
            height: 80.0,
            decoration: BoxDecoration(
              color: orange,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/info_screen');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Tell me more!',
                    style: TextStyle(
                      fontFamily: '',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 36,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
