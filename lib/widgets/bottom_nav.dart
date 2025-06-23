import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  final HomeController controller;

  const BottomNavBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: controller.selectedIndex.value,
      onTap: controller.changeTab,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF6D5FFD),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Files"),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: "Help"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    ));
  }
}
