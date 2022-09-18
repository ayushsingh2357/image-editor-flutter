import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editing_app/widgets/edit_image_viewmodel.dart';
import 'package:image_editing_app/widgets/image_texts.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key, required this.selectedImage});
  final String selectedImage;
  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              _selectedImage,
              for (int i = 0; i < texts.length; i++)
                Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    onTap: () => setCurrentIndex(context, i),
                    onLongPress: () => setCurrentIndex(context, i),
                    child: Draggable(
                      feedback: ImageText(textInfo: texts[i]),
                      child: ImageText(textInfo: texts[i]),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset off = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = off.dy - 80;
                          texts[i].left = off.dx;
                        });
                      },
                    ),
                  ),
                ),
              // creatorText.text.isNotEmpty
              //     ? Positioned(
              //         left: 0,
              //         bottom: 0,
              //         child: Text(
              //           creatorText.text,
              //           style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black.withOpacity(0.3)),
              //         ))
              //     : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: _addNewText,
    );
  }

  Widget get _selectedImage => Center(
        child: Image.file(
          File(widget.selectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      );

  Widget get _addNewText => FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => addNewDialog(context),
        tooltip: "Add new text",
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );

  AppBar get _appBar => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                tooltip: 'Save Image',
              ),
              IconButton(
                onPressed: () {
                  incrementFontSize();
                },
                icon: const Icon(
                  Icons.text_increase,
                  color: Colors.white,
                ),
                tooltip: 'Increase Font Size',
              ),
              IconButton(
                onPressed: () {
                  decrementFontSize();
                },
                icon: const Icon(
                  Icons.text_decrease,
                  color: Colors.white,
                ),
                tooltip: 'Decrease Font Size',
              ),
              IconButton(
                onPressed: () {
                  alignTextLeft();
                },
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.white,
                ),
                tooltip: 'Align Left',
              ),
              IconButton(
                onPressed: () {
                  alignTextCenter();
                },
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.white,
                ),
                tooltip: 'Align Center',
              ),
              IconButton(
                onPressed: () {
                  alignTextRight();
                },
                icon: const Icon(
                  Icons.format_align_right,
                  color: Colors.white,
                ),
                tooltip: 'Align Right',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.white,
                ),
                tooltip: 'Bold',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.white,
                ),
                tooltip: 'Italic',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_underline,
                  color: Colors.white,
                ),
                tooltip: 'Underline',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.white,
                ),
                tooltip: 'Add New Line',
              ),
              Tooltip(
                message: 'White',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.white);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Black',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.black);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Red',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.red);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Green',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.green);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Blue',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.blue);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Yellow',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.yellow);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Pink',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.pink);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: 'Orange',
                child: GestureDetector(
                  onTap: (() {
                    changeTextColor(Colors.orange);
                  }),
                  child: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
