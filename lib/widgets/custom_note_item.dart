import 'package:flutter/material.dart';
import 'package:flutter_notes_app_hive/views/edit_notes_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const EditNotes()));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Flutter tips",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: const Text(
                "this is subtitle",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,

                ),
              ),
              trailing: IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                ),
              ),
              contentPadding: EdgeInsets.zero,
            ),
            const Text("May21 , 2022",style: TextStyle(
              color: Colors.black,
            ),),
          ],
        ),
      ),
    );
  }
}
