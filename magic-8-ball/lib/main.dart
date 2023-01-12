import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Ask Me Anything'),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNum = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          child: Image.asset('images/ball$ballNum.png'),
          onPressed: () {
            setState(() {
              ballNum = Random().nextInt(5) + 1;
            });
          },
        ),
      ),
    );
  }
}
