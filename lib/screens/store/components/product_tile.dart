import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/product_controller.dart';
import '../../../models/product_api_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProductController>().setSelectedId = data.id!;
        context.read<ProductController>().selectProduct = data;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: context.watch<ProductController>().selectedId == data.id
              ? bgColor
              : secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: defaultPadding),
              height: 80,
              width: 140,
              decoration: BoxDecoration(
                border: Border.all(color: secondaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(data.images!.last),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title!,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Text(data.price!.toString()),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${data.discountPercentage!}% off",
                      style: const TextStyle(color: Colors.green, fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
