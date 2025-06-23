import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../widgets/note_card.dart';
import 'create_note_screen.dart';

class PersonalNotesScreen extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Personal', style: TextStyle(color: Colors.black)),
        leading: const Icon(Icons.arrow_back_ios, color: Color(0xFF6D5FFD)),
        actions: const [
          Icon(Icons.search, color: Color(0xFF6D5FFD)),
          SizedBox(width: 16),
        ],
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
            GestureDetector(
              onTap: () => Get.to(() => CreateNoteScreen()),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Icon(Icons.add_circle_outline, size: 36, color: Color(0xFF6D5FFD)),
                ),
              ),
            ),
            ...controller.notes.map((note) => NoteCard(note)).toList()
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6D5FFD),
        onPressed: () => Get.to(() => CreateNoteScreen()),
        label: const Text('Add New Notes'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
