import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:task/api/ProductsResponse.dart';

import '../api/Products.dart';
@singleton
class ApiManger {
  static const String baseUrl = 'dummyjson.com';
  Future<ProductsResponse> getProducts() async {
    var uri = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(uri);

    var results = ProductsResponse.fromJson(jsonDecode(response.body));
    print("results = ${results.products?[0].title}");
    return results;
  }
}
