import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:flutter_notes_app_hive/widgets/show_note_view_body.dart';

class ShowNoteView extends StatelessWidget {
  const ShowNoteView({super.key, required this.note, this.isEditNote = false});

  final NoteModel note;
  final bool isEditNote;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  ShowNoteViewBody(
        note: note,
        isEditMode: isEditNote,
      ),
    );
  }
}
