import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';

class ListViewColorsPick extends StatefulWidget {
  const ListViewColorsPick({
    super.key,
  });

  @override
  State<ListViewColorsPick> createState() => _ListViewColorsPickState();
}

class _ListViewColorsPickState extends State<ListViewColorsPick> {
  List<Color> colors = [
    const Color(0xffFFFFFF),
    const Color(0xffFF6347),
    const Color(0xff90EE90),
    const Color(0xff87CEEB),
    const Color(0xffFFD700),
    const Color(0xffFF69B4),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: CustomCircleAvatarPickColors(
                isSelected: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomCircleAvatarPickColors extends StatelessWidget {
  const CustomCircleAvatarPickColors({
    super.key,
    required this.isSelected,
    required this.color,
  });
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 22,
            backgroundColor: color,
          );
  }
}
