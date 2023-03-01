import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/todo_controllers.dart';

class TaskChart extends StatelessWidget {
  const TaskChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              sections: [
                PieChartSectionData(
                    value:
                        context.watch<ToDoController>().numberOfCompletedTasks,
                    radius: 25,
                    showTitle: false,
                    color: primaryColor),
                PieChartSectionData(
                    value:
                        context.watch<ToDoController>().numberOfIncompleteTasks,
                    radius: 22,
                    showTitle: false,
                    color: Colors.red),
              ],
            ),
          ),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "${((context.watch<ToDoController>().numberOfCompletedTasks / (context.watch<ToDoController>().numberOfIncompleteTasks + context.watch<ToDoController>().numberOfCompletedTasks)) * 100).toString().substring(0, 2)} %",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Text("Completed"),
            ]),
          )
        ],
      ),
    );
  }
}
