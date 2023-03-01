import 'package:admin_pannel_p1/responsive.dart';
import 'package:admin_pannel_p1/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/MyFiles.dart';
import 'file_info_card.dart';
import 'recent_files.dart';

class MyFilesAndRecentFiles extends StatelessWidget {
  const MyFilesAndRecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Files",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Icon(Icons.add),
                        Text("All Files"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Responsive(
              mobile: FileInfoCardGridView(
                crossAxisCount: width > 600 ? 4 : 2,
                childAspectRatio: width > 600 ? 1 : 1.3,
              ),
              tablet: const FileInfoCardGridView(
                crossAxisCount: 4,
              ),
              desktop: FileInfoCardGridView(
                childAspectRatio: width > 1400 ? 1.4 : 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        const RecentFiles(),
        if (Responsive.isMobile(context))
          const SizedBox(
            height: defaultPadding,
          ),
        if (Responsive.isMobile(context)) const StorageDetails()
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    this.childAspectRatio = 1,
    this.crossAxisCount = 4,
    Key? key,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding),
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      itemBuilder: (context, index) => FileInfoCard(data: demoMyFiels[index]),
    );
  }
}
