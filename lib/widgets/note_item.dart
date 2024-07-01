import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:flutter_notes_app_hive/views/show_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ShowNoteView(
              note: noteModel,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              //Color
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      noteModel.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    noteModel.subtitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  // trailing: IconButton(
                  //   color: Colors.black,
                  //   onPressed: () {
                  //     noteModel.delete();
                  //     BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  //   },
                  //   icon: const Icon(
                  //     Icons.delete,
                  //   ),
                  // ),
                  trailing: Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        fixedSize: Size(125, 0),
                      ),
                        onPressed: () {
                        noteModel.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text(
                          "Delete",
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    noteModel.date,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              fixedSize: Size(125, 0),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ShowNoteView(
                    note: noteModel,
                    isEditNote: true,
                  ),
                ),
              );
            },
            label: const Text(
              "Edit",
            ),
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
    );
  }
}

// class NoteItem extends StatefulWidget {
//   const NoteItem({super.key, required this.noteModel});
//
//   final NoteModel noteModel;
//
//   @override
//   _NoteItemState createState() => _NoteItemState();
// }
//
// class _NoteItemState extends State<NoteItem> {
//   bool _isPressed = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) {
//         setState(() {
//           _isPressed = true;
//         });
//       },
//       onTapUp: (_) {
//         setState(() {
//           _isPressed = false;
//         });
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (_) => const EditNoteView(),
//           ),
//         );
//       },
//       onTapCancel: () {
//         setState(() {
//           _isPressed = false;
//         });
//       },
//       child: Center(
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           transform: Matrix4.identity()..scale(_isPressed ? 0.5 : 1.0),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               ListTile(
//                 title: Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: Text(
//                     widget.noteModel.title,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 subtitle: Text(
//                   widget.noteModel.subtitle,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                   ),
//                 ),
//                 trailing: IconButton(
//                   color: Colors.black,
//                   onPressed: () {
//                     widget.noteModel.delete();
//                     BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//                   },
//                   icon: const Icon(
//                     Icons.delete,
//                   ),
//                 ),
//                 contentPadding: EdgeInsets.zero,
//               ),
//               Text(
//                 widget.noteModel.date,
//                 style: const TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
