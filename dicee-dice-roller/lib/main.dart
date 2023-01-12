import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  @override
  Widget build(BuildContext context) {
    void setDice() {
      leftDiceNum = rollDice();
      rightDiceNum = rollDice();
    }

    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  setDice();
                });
              },
              child: Image.asset(
                'images/dice$leftDiceNum.png',
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  setDice();
                });
              },
              child: Image.asset(
                'images/dice$rightDiceNum.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

int rollDice() => Random().nextInt(6) + 1;
