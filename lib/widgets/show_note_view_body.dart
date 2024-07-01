import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:flutter_notes_app_hive/widgets/custom_app_bar.dart';
import 'package:flutter_notes_app_hive/widgets/custom_text_field.dart';

class ShowNoteViewBody extends StatelessWidget {
  const ShowNoteViewBody({
    super.key,
    required this.note,
    this.isEditMode = false,
  });

  final NoteModel note;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    String? title, content;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomAppBar(
            text: isEditMode ? "Edit Note" : "Show Note",
            icon: isEditMode ? Icons.check : Icons.abc,
            onPressed: () {
              if (isEditMode == true) {
                note.title = title ?? note.title;
                note.subtitle = content ?? note.subtitle;
                note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("This Mode Show Note"),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 32),
          CustomTextField(
            controller:
                isEditMode ? TextEditingController(text: note.title) : null,
            hintText: note.title,
            onChanged: (value) {
              title = value;
            },
            readOnly: isEditMode ? false : true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller:
                isEditMode ? TextEditingController(text: note.subtitle) : null,
            hintText: note.subtitle,
            maxLines: 4,
            onChanged: (value) {
              content = value;
            },
            readOnly: isEditMode ? false : true,
          ),
        ],
      ),
    );
  }
}
