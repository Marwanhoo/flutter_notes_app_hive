import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/widgets/custom_note_item.dart';
import 'package:flutter_notes_app_hive/widgets/custom_text_field.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const CustomNoteItem(),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        label: const Text("Add Note"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomTextField(
            hintText: 'Title',
          ),
          const CustomTextField(
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () {}, child: Text("Add"))),
          const Divider(
            height: 0,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
              label: const Text(
                "Close",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
