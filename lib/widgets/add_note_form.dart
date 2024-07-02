import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app_hive/cubits/add_note/add_note_cubit.dart';
import 'package:flutter_notes_app_hive/models/note_model.dart';
import 'package:flutter_notes_app_hive/widgets/custom_button.dart';
import 'package:flutter_notes_app_hive/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: "Note",
            maxLines: 4,
          ),
          const SizedBox(height: 10),
          const ColorsListView(),
          const SizedBox(height: 10),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();
                    var formattedCurrentData =
                        DateFormat('dd-MM-yyyy').format(currentDate);
                    NoteModel noteModel = NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: formattedCurrentData,
                      color:
                          BlocProvider.of<AddNoteCubit>(context).color.value,

                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    // when data is null
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  final List<Color> colors = const [
    Colors.grey,
    Color(0xff264653),
    Color(0xff2a9d8f),
    Color(0xffe9c46a),
    Color(0xfff4a261),
    Color(0xffe76f51),
    Color(0xffcdb4db),
    Color(0xffffc8dd),
    Color(0xffffafcc),
    Color(0xffbde0fe),
    Color(0xffa2d2ff),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.5 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
        itemCount: colors.length,
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 22.5,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
          );
  }
}
