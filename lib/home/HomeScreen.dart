import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/apiManger/ApiManger.dart';

import '../api/Products.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Products products = Products();
  ApiManger apiManger =
      ApiManger();

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
          FutureBuilder(future:apiManger.getProducts(), builder:(context, snapshot) {
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
                      CachedNetworkImage(imageUrl: snapshot.data?.products?[index].images?[0]??'',width: 180,height: 110,),
                      Text(snapshot.data?.products?[index].title??""),
                      Text('Price : ${snapshot.data?.products?[index].price??0}'),
                      Row(
                        children: [
                          Text('Rating : ${snapshot.data?.products?[index].rating}',style: TextStyle(
                            fontSize: 14
                          ),),
                        Icon(Icons.star,color: Colors.amber,)
                        ],
                      ),


                    ],
                  ),
                );
              },itemCount: snapshot.data?.products?.length,)

            );
          },)
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