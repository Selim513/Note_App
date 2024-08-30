import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_textFormField.dart';

class CustomAddNotesWidget extends StatelessWidget {
  const CustomAddNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
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
            const CustomElevatedButton(
              name: 'Add',
            )
          ],
        ),
      ),
    );
  }
}
