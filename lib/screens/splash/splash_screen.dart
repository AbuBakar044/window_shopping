import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_shopping/controllers/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController());
    return const Scaffold();
  }
}
