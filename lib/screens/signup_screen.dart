import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button and title
              SizedBox(
                height: 56,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Input fields
              TextField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  hintText: 'User name',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Obx(() => TextField(
                controller: controller.passwordController,
                obscureText: controller.obscurePassword.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  suffixIcon: IconButton(
                    icon: Icon(controller.obscurePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              )),
              const SizedBox(height: 16),

              Obx(() => TextField(
                controller: controller.confirmPasswordController,
                obscureText: controller.obscureConfirmPassword.value,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  suffixIcon: IconButton(
                    icon: Icon(controller.obscureConfirmPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: controller.toggleConfirmPasswordVisibility,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              )),

              const Spacer(),

              // Bottom content pinned to the bottom
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'By continuing, you agree to our ',
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(color: Color(0xFF6D5FFD)),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(color: Color(0xFF6D5FFD)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6D5FFD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: controller.signUp,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ],
          ),

          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       height: 56,
          //       child: Stack(
          //         alignment: Alignment.center,
          //         children: [
          //           const Center(
          //             child: Text(
          //               'Sign up',
          //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          //             ),
          //           ),
          //           Positioned(
          //             left: 0,
          //             child: IconButton(
          //               icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          //               onPressed: () => Get.back(),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(height: 30),
          //     TextField(
          //       controller: controller.usernameController,
          //       decoration: InputDecoration(
          //         hintText: 'User name',
          //         filled: true,
          //         fillColor: Colors.white,
          //         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(12),
          //           borderSide: BorderSide.none,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 16),
          //     TextField(
          //       controller: controller.emailController,
          //       decoration: InputDecoration(
          //         hintText: 'Email',
          //         filled: true,
          //         fillColor: Colors.white,
          //         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(12),
          //           borderSide: BorderSide.none,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 16),
          //     Obx(() => TextField(
          //       controller: controller.passwordController,
          //       obscureText: controller.obscurePassword.value,
          //       decoration: InputDecoration(
          //         hintText: 'Password',
          //         filled: true,
          //         fillColor: Colors.white,
          //         contentPadding:
          //         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //         suffixIcon: IconButton(
          //           icon: Icon(controller.obscurePassword.value
          //               ? Icons.visibility_off
          //               : Icons.visibility),
          //           onPressed: controller.togglePasswordVisibility,
          //         ),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(12),
          //           borderSide: BorderSide.none,
          //         ),
          //       ),
          //     )),
          //     const SizedBox(height: 16),
          //     Obx(() => TextField(
          //       controller: controller.confirmPasswordController,
          //       obscureText: controller.obscureConfirmPassword.value,
          //       decoration: InputDecoration(
          //         hintText: 'Confirm Password',
          //         filled: true,
          //         fillColor: Colors.white,
          //         contentPadding:
          //         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //         suffixIcon: IconButton(
          //           icon: Icon(controller.obscureConfirmPassword.value
          //               ? Icons.visibility_off
          //               : Icons.visibility),
          //           onPressed: controller.toggleConfirmPasswordVisibility,
          //         ),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(12),
          //           borderSide: BorderSide.none,
          //         ),
          //       ),
          //     )),
          //     const SizedBox(height: 24),
          //     RichText(
          //       textAlign: TextAlign.center,
          //       text: const TextSpan(
          //         text: 'By continuing, you agree to our ',
          //         style: TextStyle(color: Colors.black54),
          //         children: [
          //           TextSpan(
          //             text: 'Terms of Service',
          //             style: TextStyle(color: Color(0xFF6D5FFD)),
          //           ),
          //           TextSpan(text: ' and '),
          //           TextSpan(
          //             text: 'Privacy Policy.',
          //             style: TextStyle(color: Color(0xFF6D5FFD)),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(height: 20),
          //     SizedBox(
          //       width: double.infinity,
          //       height: 48,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: const Color(0xFF6D5FFD),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30),
          //           ),
          //         ),
          //         onPressed: controller.signUp,
          //         child: const Text(
          //           'Sign Up',
          //           style: TextStyle(fontSize: 16, color: Colors.white),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 12),
          //   ],
          // ),
        ),
      ),
    );
  }
}
