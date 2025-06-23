import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // Implement actual login logic or API call
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Dummy login success
      Get.snackbar('Success', 'Logged in as $email');
      // Navigate to HomeScreen
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.offAll(() => HomeScreen());
      });
    } else {
      Get.snackbar('Error', 'Please enter email and password');
    }
  }
}
