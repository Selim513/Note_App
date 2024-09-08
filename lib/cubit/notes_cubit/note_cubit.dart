import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubit/notes_cubit/notes_state.dart';
import 'package:note_app/instant.dart';
import 'package:note_app/model/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());
  List<NoteModel>? notes;
 
  fetchData() {
    var noteBox = Hive.box<NoteModel>(kBoxName);
    notes = noteBox.values.toList();
    emit(NotesSuccessState());
  }
}
