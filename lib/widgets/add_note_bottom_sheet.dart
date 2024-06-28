import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/widgets/custom_button.dart';
import 'package:flutter_notes_app_hive/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: "Title",
            ),
            SizedBox(height: 10),
            CustomTextField(
              hintText: "Note",
              maxLines: 4,
            ),
            SizedBox(height: 10),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

