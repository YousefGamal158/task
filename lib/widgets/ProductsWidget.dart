import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../api/Products.dart';

class ProductsWidget extends StatelessWidget {
  List<Products>? productsList;
  ProductsWidget(this.productsList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 15,


        ), itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 1),
            decoration: BoxDecoration(border:Border.all(width: 2.5,color: Colors.blue )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(imageUrl: productsList?[index].images?[0]??'',width: 180,height: 110,),
                Text(productsList?[index].title??""),
                Text('Price : ${productsList?[index].price??0}'),
                Row(
                  children: [
                    Text('Rating : ${productsList?[index].rating}',style: TextStyle(
                        fontSize: 14
                    ),),
                    Icon(Icons.star,color: Colors.amber,)
                  ],
                ),


              ],
            ),
          );
        },itemCount: productsList?.length,)

    );
  }
}
