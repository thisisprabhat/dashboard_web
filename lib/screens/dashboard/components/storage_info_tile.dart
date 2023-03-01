import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class StorageInfoTile extends StatelessWidget {
  const StorageInfoTile({
    Key? key,
    required this.title,
    required this.svgImage,
    required this.totalNumberOfFiles,
    required this.size,
  }) : super(key: key);

  final String title;
  final String svgImage;
  final int totalNumberOfFiles;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
          border: Border.all(width: 2, color: primaryColor.withOpacity(.15))),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(svgImage),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$totalNumberOfFiles Files",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text("${size}GB")
        ],
      ),
    );
  }
}
