import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const EditNoteViewBody(),
    );
  }
}
