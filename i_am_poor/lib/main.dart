import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text('I Have Nothing'),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/cobweb.png'),
          ),
        ),
      ),
    ),
  );
}
