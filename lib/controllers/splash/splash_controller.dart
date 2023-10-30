import 'package:get/get.dart';
import 'package:window_shopping/screens/auth/login.dart';
import 'package:window_shopping/screens/home/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => LoginScreen());
    });
    super.onInit();
  }
}
