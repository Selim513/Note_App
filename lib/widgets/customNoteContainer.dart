import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/notes_cubit/note_cubit.dart';
import 'package:note_app/cubit/notes_cubit/notes_state.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgets/custom_Listview_note_container.dart';

class CustomNoteContainer extends StatelessWidget {
  const CustomNoteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

        return ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return CustomListViewContainer(notes: notes[index]);
          },
        );
      },
    );
  }
}
