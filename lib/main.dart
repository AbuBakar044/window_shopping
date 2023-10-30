import 'package:window_shopping/screens/splash/splash_screen.dart';

import '/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Window Shopping',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

