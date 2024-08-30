import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note_app/widgets/customNoteContainer.dart';
import 'package:note_app/widgets/custom_AppBar.dart';
import 'package:note_app/widgets/custom_floating_action_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Gap(35),
            SizedBox(height: 50, child: CustomAppBar()),
            Expanded(
              child: CustomNoteContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
