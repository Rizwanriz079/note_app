import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home_screen.dart';

class SignUpController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void signUp() {
    if (passwordController.text == confirmPasswordController.text &&
        emailController.text.isNotEmpty &&
        usernameController.text.isNotEmpty) {
      Get.snackbar("Success", "Account created for ${usernameController.text}");
      // Navigate to HomeScreen after brief delay
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.offAll(() => HomeScreen());
      });
    } else {
      Get.snackbar("Error", "Please fill all fields and confirm password correctly.");
    }
  }
}
