import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const Text(
            "May21 , 2022",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
