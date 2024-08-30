import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child:  Text('$name')));
  }
}
