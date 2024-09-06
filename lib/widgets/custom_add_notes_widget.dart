import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_state.dart';
import 'package:note_app/cubit/notes_cubit/note_cubit.dart';
import 'package:note_app/widgets/custom_Form_Add_Note.dart';

class CustomAddNotesWidget extends StatefulWidget {
  const CustomAddNotesWidget({
    super.key,
  });

  @override
  State<CustomAddNotesWidget> createState() => _CustomAddNotesWidgetState();
}

class _CustomAddNotesWidgetState extends State<CustomAddNotesWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteFailuerState) {
                print('Failled ${state.errorMessage}');
              }
              if (state is AddNoteSuccessState) {
                BlocProvider.of<NotesCubit>(context).fetchData();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const CustomFormAddNote(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
