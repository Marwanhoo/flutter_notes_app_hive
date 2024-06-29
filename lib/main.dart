import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app_hive/constants/constants.dart';
import 'package:flutter_notes_app_hive/cubits/my_bloc_observer.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:flutter_notes_app_hive/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(nameOpenBox);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'notes',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: "Poppins",
      ),
      themeMode: ThemeMode.dark,
      home: const NotesView(),
    );
  }
}
