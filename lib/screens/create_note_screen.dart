import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class CreateNoteScreen extends StatefulWidget {
  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  File? selectedImage;
  String? audioPath;

  final NoteController noteController = Get.find();

  void pickImage() async {
    final img = await noteController.pickImage();
    if (img != null) setState(() => selectedImage = img);
  }

  void saveNote() {
    if (titleCtrl.text.isNotEmpty && descCtrl.text.isNotEmpty) {
      noteController.addNote(
        titleCtrl.text,
        descCtrl.text,
        image: selectedImage,
        audio: audioPath,
      );
      Get.back();
    } else {
      Get.snackbar('Incomplete', 'Please enter title and description.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        backgroundColor: const Color(0xFF6D5FFD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descCtrl,
              maxLines: 6,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.image),
              label: const Text('Pick Image'),
              onPressed: pickImage,
            ),
            if (selectedImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Image.file(selectedImage!, height: 100),
              ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.mic),
              label: const Text('Attach Audio'),
              onPressed: () {
                // Stub: set dummy audio path or integrate recorder
                setState(() {
                  audioPath = '/dummy/audio/path.mp3';
                });
              },
            ),
            if (audioPath != null)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text('Audio added 🎤'),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNote,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6D5FFD),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Save Note"),
            )
          ],
        ),
      ),
    );
  }
}
