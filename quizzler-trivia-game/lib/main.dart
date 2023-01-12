import 'package:flutter/material.dart';
import 'quiz_logic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  QuizLogic quiz = QuizLogic();

  Icon checkIcon() => Icon(
        Icons.check,
        color: Colors.green,
      );

  Icon crossIcon() => Icon(
        Icons.close,
        color: Colors.red,
      );

  void checkAnswer(bool button) {
    setState(() {
      if (quiz.bank[quiz.index].answer == button) {
        scoreKeeper.add(checkIcon());
      } else {
        scoreKeeper.add(crossIcon());
      }
      if (quiz.isLast()) {
        scoreKeeper.clear();
      }
      quiz.next();
    });
  }

  @override
  Widget build(BuildContext context) {
    _onAlertPressed(context) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Quiz Complete!",
        desc: "You finished the quiz.",
        buttons: [
          DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.bank[quiz.index].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButton(
              child: Container(
                color: Colors.green,
                width: 400,
                height: 70,
                child: Center(
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                if (quiz.isLast()) {
                  _onAlertPressed(context);
                }
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButton(
              child: Container(
                color: Colors.red,
                width: 400,
                height: 70,
                child: Center(
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                if (quiz.isLast()) {
                  _onAlertPressed(context);
                }
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
