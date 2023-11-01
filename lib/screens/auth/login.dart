import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_shopping/constants/app_constants.dart';
import 'package:window_shopping/controllers/auth/auth_controller.dart';
import 'package:window_shopping/screens/auth/register.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginCtrl = Get.put<AuthController>(AuthController());
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
              key: loginCtrl.formKey,
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
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Welcome to My App',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: loginCtrl.emailController,
                            validator: customValidator,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon:
                                  Icon(Icons.email, color: Color(0xFF5363E8)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: loginCtrl.passController,
                            validator: customValidator,
                            style: const TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon:
                                  Icon(Icons.lock, color: Color(0xFF5363E8)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {

                              if (loginCtrl.formKey.currentState!.validate()) {
                                loginCtrl.loginUser(
                                loginCtrl.emailController.text,
                                loginCtrl.passController.text,
                              );
                              }
                              
                            },
                            child: const Text('Log In'),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Get.to(() => RegisterScreen());
                            },
                            child: const Text(
                              'Create an Account',
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
