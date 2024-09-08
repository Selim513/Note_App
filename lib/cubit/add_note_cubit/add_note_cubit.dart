import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_state.dart';
import 'package:note_app/instant.dart';
import 'package:note_app/model/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xff87CEEB);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoadingState());
    try {
      var noteBox = Hive.box<NoteModel>(kBoxName);
      await noteBox.add(note);

      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailuerState(errorMessage: e.toString()));
    }
  }
}
