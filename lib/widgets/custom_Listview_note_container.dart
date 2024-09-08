import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubit/notes_cubit/note_cubit.dart';
import 'package:note_app/edit_note.dart';
import 'package:note_app/model/note_model.dart';

class CustomListViewContainer extends StatelessWidget {
  CustomListViewContainer({
    super.key,
    required this.notes,
  });

  NoteModel notes;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteView(notes: notes),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notes.title,
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    notes.delete();
                    BlocProvider.of<NotesCubit>(context).fetchData();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            const Gap(5),
            SizedBox(
              width: 200,
              child: Text(
                '${notes.content} ',
                style: TextStyle(fontSize: 15, color: Colors.grey[800]),
              ),
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(notes.date),
                  style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
