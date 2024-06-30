import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:flutter_notes_app_hive/views/edit_note_view.dart';
import 'package:flutter_notes_app_hive/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        return ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const EditNoteView(),
                  ),
                );
              },
              child:  NoteItem(
                noteModel: notes[index],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: notes.length,
        );
      },
    );
  }
}
