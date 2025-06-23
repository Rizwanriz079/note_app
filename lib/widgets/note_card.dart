import 'dart:io';
import 'package:flutter/material.dart';
import '../controllers/note_controller.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          note.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          note.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        if (note.image != null) ...[
          const SizedBox(height: 8),
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(note.image!, height: 80, width: double.infinity, fit: BoxFit.cover)),
        ],
        if (note.audioPath != null)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.audiotrack_rounded),
          )
      ]),
    );
  }
}
