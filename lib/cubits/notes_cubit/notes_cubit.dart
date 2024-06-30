import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/constants/constants.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:hive/hive.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());


  List<NoteModel>? notes;
  fetchAllNotes()async{
      var notesBox = Hive.box<NoteModel>(nameOpenBox);
      // load all notes
      notes = notesBox.values.toList();
      print("Notes $notes");
  }
}
