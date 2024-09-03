class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccessState extends AddNoteState {}

class AddNoteFailuerState extends AddNoteState {
  final String errorMessage;

  AddNoteFailuerState({required this.errorMessage});
}
