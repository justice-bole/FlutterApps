import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_display.dart';
import 'reusable_card.dart';

const cardColor = Color(0xFF1E1D33);
const bottomButtonColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    child: IconDisplay(
                      label: 'MALE', 
                      icon: FontAwesomeIcons.mars,
                      ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    child: IconDisplay(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(color: cardColor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: cardColor),
                ),
                Expanded(
                  child: ReusableCard(color: cardColor),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            height: 80.0,
            color: bottomButtonColor,
          ),
        ],
      ),
    );
  }
}
