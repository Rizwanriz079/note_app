import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/walkthrough_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note-Taking App',
      debugShowCheckedModeBanner: false,
      home: WalkthroughScreen(),
    );
  }
}
