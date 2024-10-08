import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
       this.controller,
      this.maxLines = 1,
      this.onChanged});
  final String hintText;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This Filed is required ';
        }
        return null;
      },
      maxLines: maxLines,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          focusedBorder: borderBuild(),
          enabledBorder: borderBuild(),
          border: borderBuild(),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.cyan)),
    );
  }
}

OutlineInputBorder borderBuild() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Colors.white));
}
