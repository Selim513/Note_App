import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Notes',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        const Spacer(),
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.grey[900],
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {},
            icon: const Icon(Icons.search))
      ],
    );
  }
}
