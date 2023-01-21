import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(children: [
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            'Add Task',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
            ),
          ),
          SizedBox(
            width: 300.0,
            child: TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (value) {
                text = value;
              },
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          SizedBox(
            height: 60.0,
            width: 300.0,
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false).addTask(text!);

                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          )
        ]),
      ),
    );
  }
}
