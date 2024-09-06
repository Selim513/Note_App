import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/cubit/notes_cubit/note_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgets/custom_textFormField.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.notes});
  final NoteModel notes;
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Note',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.grey[900],
            ),
            onPressed: () {
              widget.notes.title = title ?? widget.notes.title;
              widget.notes.content = content ?? widget.notes.content;
              widget.notes.save();
              BlocProvider.of<NotesCubit>(context).fetchData();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) {
                title = value;
              },
              hintText: 'Title',
            ),
            const Gap(15),
            CustomTextFormField(
              onChanged: (value) {
                content = value;
              },
              hintText: 'Content',
              maxLines: 4,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
