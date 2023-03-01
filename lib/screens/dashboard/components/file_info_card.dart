import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/MyFiles.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CloudStorageInfo data;

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: data.color.withOpacity(.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: SvgPicture.asset(
                  data.svgSrc,
                  color: data.color,
                ),
              ),
              IconButton(
                hoverColor: Colors.grey,
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          Text(data.title),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  color: data.color.withOpacity(.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              LayoutBuilder(
                builder: ((context, constraints) => Container(
                      width: constraints.maxWidth * data.percentage * .01,
                      height: 5,
                      decoration: BoxDecoration(
                        color: data.color,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${data.numOfFiels}Files',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white70),
              ),
              Text(
                data.totalStorage,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
