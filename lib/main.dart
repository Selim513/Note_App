import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/bloc_observer.dart';
import 'package:note_app/cubit/notes_cubit/note_cubit.dart';
import 'package:note_app/home_view.dart';
import 'package:note_app/instant.dart';
import 'package:note_app/model/note_model.dart';

void main() async {
  Bloc.observer = SimpleBlocObserve();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kBoxName);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
          theme: ThemeData(brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
          home: const HomeView()),
    );
  }
}
