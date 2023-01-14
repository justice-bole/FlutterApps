import 'package:flutter/material.dart';
import 'constants.dart';

class IconDisplay extends StatelessWidget {
  final String label;
  final IconData icon;
  const IconDisplay({this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: smallTextStyle,
        ),
      ],
    );
  }
}
