import 'package:admin_pannel_p1/controllers/product_controller.dart';
import 'package:admin_pannel_p1/models/product_api_model.dart';
import 'package:admin_pannel_p1/network/remote/api/products_api.dart';
import 'package:admin_pannel_p1/screens/dashboard/components/top_bar.dart';
import 'package:admin_pannel_p1/screens/store/components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<ProductController>().selectedProduct;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
              right: defaultPadding, top: defaultPadding, left: defaultPadding),
          child: TopBar(title: "Store"),
        ),
        Expanded(
          child: Row(
            children: [
              const Expanded(flex: 3, child: ProductList()),
              Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  margin: const EdgeInsets.only(
                      right: defaultPadding,
                      top: defaultPadding,
                      bottom: defaultPadding),
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: FutureBuilder(
                    future: ProductApi.getSelectedProduct(
                        context.read<ProductController>().selectedId),
                    builder: (context, snapshot) {
                      final productController =
                          context.watch<ProductController>();
                      if (productController.selectedId == 0) {
                        return const Center(
                          child: Text("Select a product to view details"),
                        );
                      }
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        final ProductModel selectedProduct =
                            ProductModel.fromJson(snapshot.data);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text(selectedProduct.price.toString())],
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    this.replacementText = "Select a product to view details.",
    required this.child,
  }) : super(key: key);
  final String replacementText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.only(
          right: defaultPadding, top: defaultPadding, bottom: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Visibility(
        visible: true,
        replacement: Center(
          child: Text(replacementText),
        ),
        child: child,
      ),
    );
  }
}
