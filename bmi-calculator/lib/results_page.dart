import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  double bmiResult;
  String weightClass;
  String description;

  ResultsPage({this.bmiResult, this.weightClass, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          padding: EdgeInsets.only(top: 25.0),
          height: 100,
          child: Text(
            'Your Result',
            style: largeTextStyle,
          ),
        ),
        Expanded(
          child: ReusableCard(
            color: activeCardColor,
            child: Column(
              children: [
                SizedBox(
                  height: 90.0,
                ),
                Text(
                  weightClass,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 90.0,
                ),
                Text(
                  bmiResult.toStringAsFixed(1),
                  style: TextStyle(fontSize: 90.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 90.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: 80.0,
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              color: buttonColor,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: mediumTextStyle,
                ),
              )),
        )
      ]),
    );
  }
}
