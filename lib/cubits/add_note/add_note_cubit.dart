import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/constants/constants.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Colors.grey;
  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(nameOpenBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

  int? currentIndex;
  changeItem(int index) {
    currentIndex = index;


    emit(ChangeItemState());
  }
}
