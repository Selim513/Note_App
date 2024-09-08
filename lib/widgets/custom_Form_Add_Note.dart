import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_state.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_listview_colors.dart';
import 'package:note_app/widgets/custom_textFormField.dart';

class CustomFormAddNote extends StatefulWidget {
  const CustomFormAddNote({
    super.key,
  });

  @override
  State<CustomFormAddNote> createState() => _CustomFormAddNoteState();
}

class _CustomFormAddNoteState extends State<CustomFormAddNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: titleController,
            hintText: 'Title',
          ),
          const Gap(15),
          CustomTextFormField(
            hintText: 'Content',
            controller: contentController,
            maxLines: 4,
          ),
          const Gap(10),
          const ListViewColorsPick(
            
          ),
          const Gap(30),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return state is AddNoteLoadingState
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : CustomElevatedButton(
                      name: 'Add',
                      onpress: () {
                        if (formKey.currentState!.validate()) {
                          var note = NoteModel(
                            title: titleController.text,
                            content: contentController.text,
                            color: Colors.blue.value,
                            date: DateTime.now(),
                          );
                          BlocProvider.of<AddNoteCubit>(context).addNote(note);
                        }
                      },
                    );
            },
          )
        ],
      ),
    );
  }
}
