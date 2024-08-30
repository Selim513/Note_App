import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_textFormField.dart';

class CustomAddNotesWidget extends StatefulWidget {
  const CustomAddNotesWidget({
    super.key,
  });

  @override
  State<CustomAddNotesWidget> createState() => _CustomAddNotesWidgetState();
}

class _CustomAddNotesWidgetState extends State<CustomAddNotesWidget> {
  late Box<NoteModel> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('model');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
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
              const Gap(30),
              CustomElevatedButton(
                name: 'Add',
                onpress: () {
                  String id =
                      "${DateTime.now().millisecond}${titleController.text}";
                  if (formKey.currentState!.validate()) {
                    box.put(
                        id,
                        NoteModel(
                            title: titleController.text,
                            content: contentController.text));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
