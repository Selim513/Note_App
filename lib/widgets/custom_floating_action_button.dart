import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_add_notes_widget.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(backgroundColor: Colors.cyan),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.grey[800],
            context: context,
            builder: (context) {
              return const CustomAddNotesWidget();
            },
          );
        },
        icon: const Icon(

          Icons.add,
          color: Colors.black,
          
        ));
  }
}
