import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> addedProducts = [];

  get totlQuantity => addedProducts.length;

  get totalPrice {
    double totalPrice = 0;

    addedProducts.forEach((element) {
      totalPrice += element.price;
    });

    return totalPrice;
  }

  void addProduct({required ProductModel product}) {
    addedProducts.add(product);
    notifyListeners();
  }

  void removeProduct({required ProductModel product}) {
    addedProducts.remove(product);
    notifyListeners();
  }
}
