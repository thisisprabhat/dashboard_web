import 'package:admin_pannel_p1/constants.dart';
import 'package:admin_pannel_p1/controllers/todo_controllers.dart';
import 'package:admin_pannel_p1/screens/dashboard/components/top_bar.dart';
import 'package:admin_pannel_p1/screens/task/components/responsive_task_chart.dart';
import 'package:admin_pannel_p1/screens/task/components/task_chart.dart';
import 'package:admin_pannel_p1/screens/task/components/task_chart_details.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/tasks.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: TopBar(
              title: "Tasks",
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      if (MediaQuery.of(context).size.width < 906)
                        const ResponsiveTaskChart(),
                      const Expanded(child: Tasks()),
                    ],
                  ),
                ),
                if (MediaQuery.of(context).size.width > 906)
                  const Expanded(
                    flex: 2,
                    child: ResponsiveTaskChart(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
