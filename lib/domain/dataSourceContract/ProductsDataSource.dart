import '../../api/Products.dart';

abstract class ProductsDataSource {
  Future<List<Products>?> getProducts();
}