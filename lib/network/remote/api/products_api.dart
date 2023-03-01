import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../controllers/product_controller.dart';
import '../../../models/product_api_model.dart';

class ProductApi {
  List<dynamic>? listOfProducts;

  static Future<List<dynamic>> getProductList() async {
    const url = "https://dummyjson.com/products";

    Response response;
    var dio = Dio();
    response = await dio.get(url);

    var json = response.data["products"];
    // context.read<ProductController>().setProductList =
    //     json.map<ProductModel>(ProductModel.fromJson).toList();
    return json;
  }

  static Future<dynamic> getSelectedProduct(int id) async {
    final url = "https://dummyjson.com/products/$id";

    Response response;
    var dio = Dio();
    response = await dio.get(url);

    var json = response.data["products"];
    return json;
  }
}
