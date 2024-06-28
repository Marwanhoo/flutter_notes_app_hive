import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

String nameOpenBox = "notes_box";

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(nameOpenBox);
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
