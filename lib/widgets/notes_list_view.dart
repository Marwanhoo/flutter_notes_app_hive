import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/views/edit_note_view.dart';
import 'package:flutter_notes_app_hive/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const EditNoteView()),
            );
          },
          child: const NoteItem(),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 10,
    );
  }
}
