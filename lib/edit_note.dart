import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/cubit/notes_cubit/note_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgets/custom_selected_color_edit_view.dart';
import 'package:note_app/widgets/custom_textFormField.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.notes});
  final NoteModel notes;
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  List<Color> colors = [
    const Color(0xff800080),
    const Color(0xffFF6347),
    const Color(0xff90EE90),
    const Color(0xff87CEEB),
    const Color(0xffFFD700),
    const Color(0xffFF69B4),
  ];
  String? title, content;

  late int currentIndex;
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.notes.color));
    super.initState();
  }

  @override
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
              widget.notes.color = colors[currentIndex].value;
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
            const Gap(10),
            SizedBox(
              height: 28 * 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex = index;

                      setState(() {});
                    },
                    child: CustomSelectedColorEditView(
                      colors: colors[index],
                      isSelected: currentIndex == index,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
