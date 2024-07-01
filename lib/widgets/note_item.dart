import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        //Color
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title:  Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                noteModel.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle:  Text(
              noteModel.subtitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            trailing: IconButton(
              color: Colors.black,
              onPressed: () {
                noteModel.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
            contentPadding: EdgeInsets.zero,
          ),
           Text(
            noteModel.date,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
