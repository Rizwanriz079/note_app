import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/file_card.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      bottomNavigationBar: BottomNavBar(controller),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6D5FFD),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Welcome, ',
                        style: TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'John !',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6D5FFD)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.notifications_none, color: Colors.grey[600]),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/100',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Note-Taking App',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF6D5FFD),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.shade100,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.pie_chart, size: 36, color: Colors.white),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'Available Space\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          children: [
                            TextSpan(
                              text: '20.254 GB of 25 GB Used',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 1.2,
                  children: const [
                    FileCard(
                      icon: Icons.menu_book,
                      title: 'Personal',
                      fileCount: '30 Files',
                      size: '56 MBs',
                    ),
                    FileCard(
                      icon: Icons.chat,
                      title: 'Academic',
                      fileCount: '102 Files',
                      size: '2.26 GB',
                    ),
                    FileCard(
                      icon: Icons.person,
                      title: 'Work',
                      fileCount: '300 Files',
                      size: '1.57 GB',
                    ),
                    FileCard(
                      icon: Icons.folder_copy,
                      title: 'Others',
                      fileCount: '201 Files',
                      size: '1.02 GB',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
