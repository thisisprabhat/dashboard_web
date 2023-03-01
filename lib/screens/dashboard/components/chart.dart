import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              sections: pieChartSectionData,
            ),
          ),
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Text(
                "29.1",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              const Text("of 128GB")
            ],
          ))
        ],
      ),
    );
  }
}

List<PieChartSectionData> pieChartSectionData = [
  PieChartSectionData(
      value: 25, radius: 25, showTitle: false, color: primaryColor),
  PieChartSectionData(
      value: 20, radius: 22, showTitle: false, color: const Color(0xFF26E5FF)),
  PieChartSectionData(
      value: 10, radius: 19, showTitle: false, color: const Color(0xFFFFCF26)),
  PieChartSectionData(
      value: 15, radius: 16, showTitle: false, color: const Color(0xFFEE2727)),
  PieChartSectionData(
      value: 30,
      radius: 13,
      showTitle: false,
      color: primaryColor.withOpacity(.1)),
];
