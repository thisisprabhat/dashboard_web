import 'package:admin_pannel_p1/responsive.dart';
import 'package:admin_pannel_p1/screens/task/components/task_chart.dart';
import 'package:admin_pannel_p1/screens/task/components/task_chart_details.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class ResponsiveTaskChart extends StatelessWidget {
  const ResponsiveTaskChart({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 906) {
      return Container(
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: const [
            TaskChart(),
            Padding(
              padding: EdgeInsets.only(left: 200.0),
              child: TaskChartDetails(),
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [TaskChart(), TaskChartDetails()],
        ),
      );
    }
  }
}
