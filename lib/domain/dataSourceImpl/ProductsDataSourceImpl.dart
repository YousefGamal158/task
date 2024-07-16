import 'package:injectable/injectable.dart';
import 'package:task/apiManger/ApiManger.dart';
import 'package:task/domain/dataSourceContract/ProductsDataSource.dart';

import '../../../api/Products.dart';
@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl extends ProductsDataSource{
  ApiManger apiManger;
  @factoryMethod
  ProductsDataSourceImpl(this.apiManger);
  @override
  Future<List<Products>?> getProducts()async {
    var response = await apiManger.getProducts();
    return response.products;
  }

}