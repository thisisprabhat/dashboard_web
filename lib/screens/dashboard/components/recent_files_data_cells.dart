import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/RecentFile.dart';

DataRow recentFileDataCell(RecentFile recent) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              recent.icon,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            Text(recent.title),
          ],
        ),
      ),
      DataCell(Text(recent.date)),
      DataCell(Text(recent.size)),
    ],
  );
}
