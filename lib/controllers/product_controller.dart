import 'package:admin_pannel_p1/models/product_api_model.dart';
import 'package:flutter/cupertino.dart';

class ProductController extends ChangeNotifier {
  int _selectedId = 0;
  ProductModel? _selectedProduct;
  List<ProductModel> _productList = [];

  get selectedId => _selectedId;
  get selectedProduct => _selectedProduct;
  get productList => _productList;
  set setSelectedId(int id) {
    _selectedId = id;
    notifyListeners();
  }

  set selectProduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }

  set setProductList(List<Map<String, dynamic>> json) {
    for (int i = 0; i <= json.length; i++) {
      ProductModel data = ProductModel.fromJson(json[i]);
      _productList = json.map<ProductModel>(ProductModel.fromJson).toList();
      print(_productList);
    }
  }
}
