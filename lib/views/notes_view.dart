import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/widgets/custom_button.dart';
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
            isScrollControlled: true,
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

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title;
  String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             CustomTextField(
              onSaved: (value){
                title = value;
              },
              hintText: 'Title',
            ),
             CustomTextField(
               onSaved: (value){
                 subtitle = value;
               },
              hintText: 'Content',
              maxLines: 5,
            ),
           CustomButton(text: "Add",onPressed: (){
             if (formKey.currentState!.validate()) {
               formKey.currentState!.save();
             }  else{
               autoValidateMode = AutovalidateMode.always;
               setState(() {});
             }
           },),
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
      ),
    );
  }
}
