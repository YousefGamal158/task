import 'package:injectable/injectable.dart';
import 'package:task/domain/dataSourceContract/ProductsDataSource.dart';
import 'package:task/domain/reositoryContract/ProductsRepositoryContract.dart';

import '../../api/Products.dart';
@Injectable(as: ProductsRepositoryContract)
class ProductsRepositoryImpl extends ProductsRepositoryContract{
  ProductsDataSource dataSource;
  @factoryMethod
  ProductsRepositoryImpl(this.dataSource);
  @override
  Future<List<Products>?> getProducts() {
    return dataSource.getProducts();
  }
}