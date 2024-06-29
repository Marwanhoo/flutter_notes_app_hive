import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());


  addNote(NoteModel noteModel){

  }
}
