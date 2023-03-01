import 'package:admin_pannel_p1/models/product_api_model.dart';
import 'package:admin_pannel_p1/network/remote/api/products_api.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'product_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: FutureBuilder(
        future: ProductApi.getProductList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  ProductModel product =
                      ProductModel.fromJson(snapshot.data![index]);
                  return ProductTile(
                    data: product,
                  );
                });
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
