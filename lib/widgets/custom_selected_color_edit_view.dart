import 'package:flutter/material.dart';

class CustomSelectedColorEditView extends StatelessWidget {
  const CustomSelectedColorEditView({
    super.key,
    required this.colors,
    required this.isSelected,
  });

  final Color colors;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: isSelected
          ? CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: colors,
              ),
            )
          : CircleAvatar(
              radius: 25,
              backgroundColor: colors,
            ),
    );
  }
}
