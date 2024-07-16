import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/apiManger/ApiManger.dart';
import 'package:task/domain/di/di.dart';
import 'package:task/products/ProductsViewModel.dart';
import 'package:task/widgets/ProductsWidget.dart';

import '../api/Products.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var viewModel = getIt.get<ProductsViewModel>();
  @override
  void initState() {

    super.initState();
    viewModel.loadSources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'route'
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<ProductsViewModel,ProductState>(bloc: viewModel,builder: (context, state) {
            switch(state){
              case SuccessState() : {
                var productsList = state.productsList;
                return ProductsWidget(productsList);
              }
              case LoadingState() : {
                  return  Center(child: Column(
                    children: [
                      Text(state.message),
                      CircularProgressIndicator()
                    ],
                  ),);
              }
              case ErrorState() : {
                      return Center(
                        child: Column(
                          children: [
                            Text(state.errorMessage)
                          ],
                        ),
                      );
              }
            }

          })
          // FutureBuilder(future:apiManger.getProducts(), builder:(context, snapshot) {
          //   return ProductsWidget(snapshot);
          // },)
        ],
      ),
    );
  }
}
/*ListView.builder(itemBuilder: (context, index) {
                print(snapshot.error);
                print(snapshot.data?.products?[index].images??"");


                  },
                  itemCount:snapshot.data?.products?.length,
                ),*/