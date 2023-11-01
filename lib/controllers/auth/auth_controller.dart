import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_shopping/constants/app_constants.dart';
import 'package:window_shopping/screens/admin_panel/dashboard.dart';
import 'package:window_shopping/screens/home/home_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  //var registerFormKey = GlobalKey<FormState>();

  //FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<void> loginUser(String email, String pass) async {
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      if (value.user!.uid == 'InL9QbRJ4LUW7larbFIemtwUHm92') {
        Get.offAll(() => const Dashboard());
      } else {
        Get.offAll(() => const HomeScreen());
      }
      saveUser(email);
      customSnackBar('Loggedin successfully');
    });
  }

  Future<void> signUpUser(String name, String email, String pass) async {
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      createUserInFBDB(value, name, email, pass);
    });
  }

  Future<void> createUserInFBDB(
      UserCredential userCredential, String name, email, pass) async {
    Map<String, dynamic> userData = {
      'email': email,
      'pass': pass,
      'name': name
    };
    await firebaseFirestore
        .collection(userCollection)
        .doc(userCredential.user!.uid)
        .set(userData)
        .then((value) {
      customSnackBar('Signed up successfully');
    });
  }

  Future<void> saveUser(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', email);
  }
}
