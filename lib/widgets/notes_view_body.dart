import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/widgets/custom_app_bar.dart';
import 'package:flutter_notes_app_hive/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomAppBar(
            text: "Notes",
            icon: Icons.search,
          ),
          SizedBox(height: 16),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}

