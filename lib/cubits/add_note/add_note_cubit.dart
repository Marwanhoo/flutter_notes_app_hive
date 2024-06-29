import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/constants/constants.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());


  addNote(NoteModel noteModel)async{
    emit(AddNoteLoading());
    try{
      var notesBox = Hive.box<NoteModel>(nameOpenBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    }catch (e){
      emit(AddNoteFailure(e.toString()));
    }
  }
}
