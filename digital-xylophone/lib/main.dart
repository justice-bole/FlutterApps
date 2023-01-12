import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNum) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNum.wav'));
  }

  TextButton xyloKey(int sound, Color color) {
    return TextButton(
      onPressed: () {
        playSound(sound);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        height: 108.0,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              xyloKey(1, Colors.red),
              xyloKey(2, Colors.orange),
              xyloKey(3, Colors.yellow),
              xyloKey(4, Colors.green),
              xyloKey(5, Colors.teal),
              xyloKey(6, Colors.blue),
              xyloKey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
