import 'package:task/api/Products.dart';

abstract class ProductsRepositoryContract {
  Future<List<Products>?> getProducts();
}