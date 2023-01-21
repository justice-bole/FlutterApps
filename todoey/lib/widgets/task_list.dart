import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.taskLength,
        itemBuilder: ((context, index) {
          return TaskTile(
            isChecked: value.tasks[index].isDone,
            taskTitle: value.tasks[index].name,
            checkboxCallback: (checkboxState) {
              value.updateTask(value.tasks[index]);
            },
            longPressCallback: () {
              value.deleteTask(value.tasks[index]);
            },
          );
        }),
      ),
    );
  }
}
