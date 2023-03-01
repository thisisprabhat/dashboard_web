import 'package:admin_pannel_p1/screens/dashboard/components/recent_files_data_cells.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/RecentFile.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent Files'),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: defaultPadding,
              columns: const [
                DataColumn(label: Text("File Name")),
                DataColumn(label: Text("Date")),
                DataColumn(label: Text("Size"))
              ],
              rows: List.generate(demoRecentFiles.length,
                  (index) => recentFileDataCell(demoRecentFiles[index])),
            ),
          ),
        ],
      ),
    );
  }
}
