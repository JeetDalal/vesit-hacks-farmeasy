import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmeasy/methods/db_service.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<Map<String, dynamic>> _productList = [];
  List<Map<String, dynamic>> get productList {
    return [..._productList];
  }

  addProduct(String prodName, double price, String quantity) {
    _productList.add({
      'productName': prodName,
      'productQuantity': quantity,
      'productPrice': price,
    });
    notifyListeners();
  }

  placeOrder() async {
    await DbServices().products.doc('voLcaUMA3GOhcwTwarQi').update(
        {'products': FieldValue.arrayUnion(_productList)}).then((value) {
      _productList.clear();
      notifyListeners();
    });
  }
}
