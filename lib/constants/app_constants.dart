import 'package:get/get.dart';

const String userCollection = 'users';
const String appName = 'Window Shopping';

customSnackBar(String message) {
  Get.snackbar(appName, message);
}

String? customValidator(String? val) {
  if (val!.isEmpty) {
    return '*please fill correctly';
  }
}
