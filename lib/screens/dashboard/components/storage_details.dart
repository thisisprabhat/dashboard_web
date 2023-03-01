import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_tile.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      // height: MediaQuery.of(context).size.height * .7,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Storage Details"),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          SizedBox(
            height: defaultPadding,
          ),
          StorageInfoTile(
            title: "Documents Files",
            svgImage: "assets/icons/Documents.svg",
            totalNumberOfFiles: 1486,
            size: 9.3,
          ),
          StorageInfoTile(
            title: "Media Files",
            svgImage: "assets/icons/media.svg",
            totalNumberOfFiles: 1245,
            size: 13.5,
          ),
          StorageInfoTile(
            title: "Other Files",
            svgImage: "assets/icons/folder.svg",
            totalNumberOfFiles: 9852,
            size: 1.2,
          ),
          StorageInfoTile(
            title: "Unknown Files",
            svgImage: "assets/icons/unknown.svg",
            totalNumberOfFiles: 15568,
            size: 4.6,
          )
        ],
      ),
    );
  }
}
