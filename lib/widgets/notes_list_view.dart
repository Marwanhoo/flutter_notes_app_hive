import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:flutter_notes_app_hive/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];

        if (notes.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No Notes Available",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 10), // Add some space between the text and the icon
                Icon(
                  Icons.add,
                   size: 40,
                  color: Colors.grey,
                ),
                SizedBox(height: 10), // Add some space between the icon and the additional text
                Text(
                  textAlign: TextAlign.center,
                  "Create your first note by clicking the add button",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return NoteItem(
              noteModel: notes[index],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: notes.length,
        );
      },
    );
  }
}
