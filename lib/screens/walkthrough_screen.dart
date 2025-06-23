import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/screens/signup_screen.dart';
import '../controllers/walkthrough_controller.dart';
import 'login_screen.dart';

class WalkthroughScreen extends StatelessWidget {
  final WalkthroughController controller = Get.put(WalkthroughController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            RichText(
              text: const TextSpan(
                text: 'Note-',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6D5FFD),
                ),
                children: [
                  TextSpan(
                    text: 'Taking ',
                    style: TextStyle(color: Color(0xFFAE63E4)),
                  ),
                  TextSpan(
                    text: 'App',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Image.asset(
                'assets/Diary.png', // Add this image to your assets
                height: 180,
              ),
            ),
            const SizedBox(height: 130),
            const Text(
              'Save and share notes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // Obx(() => Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(3, (index) {
            //     return Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 4),
            //       width: 8,
            //       height: 8,
            //       decoration: BoxDecoration(
            //         color: controller.currentIndex.value == index
            //             ? const Color(0xFF6D5FFD)
            //             : Colors.grey.shade300,
            //         shape: BoxShape.circle,
            //       ),
            //     );
            //   }),
            // )),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6D5FFD),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Get.to(() => SignUpScreen()),
                child: const Text(
                  'Create account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Have an account? ',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Log in',
                    style: const TextStyle(color: Color(0xFF6D5FFD)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => LoginScreen());
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
