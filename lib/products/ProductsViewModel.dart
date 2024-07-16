import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task/apiManger/ApiManger.dart';

import '../api/Products.dart';
import '../domain/reositoryContract/ProductsRepositoryContract.dart';
@injectable
class ProductsViewModel extends Cubit<ProductState>{
  ProductsRepositoryContract productsRepository;
  ProductsViewModel(this.productsRepository):super(LoadingState('Loading...'));
void loadSources ()async{
  emit(LoadingState('Loading...'));
  try {
    var response = await productsRepository.getProducts();
    emit(SuccessState(response));
  }catch(e){
    emit(ErrorState(e.toString()));

  }
}
}
sealed class ProductState {}

class SuccessState extends ProductState{
  List<Products>? productsList;
  SuccessState(this.productsList);
}
class LoadingState extends ProductState{
  String message ;
  LoadingState(this.message);

}
class ErrorState extends ProductState{
  String errorMessage;
  ErrorState(this.errorMessage);
}