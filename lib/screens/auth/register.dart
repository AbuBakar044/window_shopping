import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_shopping/constants/app_constants.dart';
import 'package:window_shopping/screens/auth/login.dart';

import '../../controllers/auth/auth_controller.dart';



class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       final registerCtrl =  Get.put<AuthController>(AuthController());
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5363E8), Color(0xFF56DDF3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Form(
              key: registerCtrl.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Create an Account',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: registerCtrl.nameController,
                            validator: customValidator,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              prefixIcon: Icon(Icons.person, color: Color(0xFF5363E8)),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: registerCtrl.emailController,
                            validator: customValidator,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email, color: Color(0xFF5363E8)),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: registerCtrl.passController,
                            validator: customValidator,
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock, color: Color(0xFF5363E8)),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                               if (registerCtrl.formKey.currentState!.validate()) {
                                registerCtrl.signUpUser(
                                  registerCtrl.nameController.text,
                                registerCtrl.emailController.text,
                                registerCtrl.passController.text,
                              );
                              }
                              
                            },
                            child: Text('Sign Up'),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              // Navigate to the login screen
                              Get.offAll(() => LoginScreen());
                            },
                            child: Text(
                              'Already have an account? Log In',
                              style: TextStyle(color: Color(0xFF5363E8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
