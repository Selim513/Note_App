import 'package:hive_flutter/adapters.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  int color;

  NoteModel(
      {required this.date,
      required this.color,
      required this.title,
      required this.content});
}
