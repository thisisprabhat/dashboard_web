import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/todo_controllers.dart';

class TaskChartDetails extends StatelessWidget {
  const TaskChartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 50),
          leading: CircleAvatar(
            backgroundColor: primaryColor,
            child: Text(
              context.watch<ToDoController>().numberOfCompletedTasks.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: const Text("Completed"),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 50),
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: Text(
              context
                  .watch<ToDoController>()
                  .numberOfIncompleteTasks
                  .toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: const Text("Incomplete"),
        )
      ],
    );
  }
}
