import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/widgets/custom_app_bar.dart';
import 'package:flutter_notes_app_hive/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CustomAppBar(
            text: "Edit Note",
            icon: Icons.check,
          ),
          SizedBox(height: 32),
          CustomTextField(hintText: "Title"),
          SizedBox(height: 16),
          CustomTextField(hintText: "Note",maxLines: 4,),
        ],
      ),
    );
  }
}
