import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  ReusableCard({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: child,
    );
  }
}
