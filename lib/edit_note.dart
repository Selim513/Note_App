import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/widgets/custom_textFormField.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
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
            onPressed: () {},
            icon: const Icon(Icons.search),
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
              controller: titleController,
              hintText: 'Title',
            ),
            const Gap(15),
            CustomTextFormField(
              hintText: 'Content',
              controller: contentController,
              maxLines: 4,
            ),
            const Spacer(),
            SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('Add')))
          ],
        ),
      ),
    );
  }
}
