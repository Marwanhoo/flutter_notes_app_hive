import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/widgets/custom_text_field.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Notes"),
        actions: [
          CircleAvatar(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check_sharp,
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            // CustomTextField(
            //   hintText: 'Title',
            // ),
            SizedBox(
              height: 20,
            ),
            // CustomTextField(
            //   hintText: 'Content',
            //   maxLines: 5,
            // ),
          ],
        ),
      ),
    );
  }
}
