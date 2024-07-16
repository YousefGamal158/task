import 'package:flutter/material.dart';
import 'package:task/home/HomeScreen.dart';

import 'domain/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      title: 'Flutter Demo',
      home:HomeScreen()
    );
  }
}


