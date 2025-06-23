import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Note {
  final String title;
  final String description;
  final File? image;
  final String? audioPath;

  Note({required this.title, required this.description, this.image, this.audioPath});
}

class NoteController extends GetxController {
  var notes = <Note>[].obs;

  Future<void> addNote(String title, String desc, {File? image, String? audio}) async {
    notes.add(Note(title: title, description: desc, image: image, audioPath: audio));
  }

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    return picked != null ? File(picked.path) : null;
  }
}
