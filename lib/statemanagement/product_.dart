import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tired/components/constants.dart';

import '../models/product_model.dart';

class ProductRepository with ChangeNotifier {
  List<Products> products = [];

  List get myProducts => products;

  Future<void> getAllProducts() async {
    // For running on real device
    // var deviceIp = 'https://veedjango.herokuapp.com';
    var deviceIp = '$BaseUrl';

    var baseUrl = "$deviceIp/api/v1/";
    var url = baseUrl + "latest-products/";
    print('testing $url');
    final Dio dio = Dio();

    try {
      var response = await dio.get("$url");
      print(response.statusCode);
      print(response.data);
      var responseData = response.data as List;
      print(responseData);

      products = responseData.map((e) => Products.fromJson(e)).toList();
      print("List of my products ${products}");
    } on DioError catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future<void> order(String price, int product, int quantity) async {
    var deviceIp = '$BaseUrl';

    var baseUrl = "$deviceIp/api/v1/";
    var url = baseUrl + "orders/";

    final Dio dio = Dio();
    var orderData = {"price": price, "product": product, "quantity": quantity};

    try {
      var response = await dio.post('$url', data: orderData);

      print(response.statusCode);
      print(response.data);
    } on DioError catch (e) {
      print(e);
    }
  }
}
