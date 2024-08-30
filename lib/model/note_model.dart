import 'package:hive_flutter/adapters.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;

  NoteModel({required this.title, required this.content});
}
