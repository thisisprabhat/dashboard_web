import 'package:admin_pannel_p1/constants.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'components/my_files_and_recent_files.dart';
import 'components/storage_details.dart';
import 'components/top_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const TopBar(title: "Dashboard"),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 5,
                  child: MyFilesAndRecentFiles(),
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    // child: Container(),
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
