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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[400],
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
                onPressed: () {},
                icon: const Icon(
                  Icons.text_increase,
                  color: Colors.white,
                ),
                tooltip: 'Increase Font Size',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.text_decrease,
                  color: Colors.white,
                ),
                tooltip: 'Decrease Font Size',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.white,
                ),
                tooltip: 'Align Left',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.white,
                ),
                tooltip: 'Align Center',
              ),
              IconButton(
                onPressed: () {},
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
                  Icons.space_bar,
                  color: Colors.white,
                ),
                tooltip: 'Add New Image',
              ),
            ],
          ),
        ),
      ),
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
                    onTap: () {
                      ("Tap detected");
                    },
                    onLongPress: (() {
                      print("Long press detected");
                    }),
                    child: Draggable(
                      feedback: ImageText(textInfo: texts[i]),
                      child: ImageText(textInfo: texts[i]),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset off = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = off.dy;
                          texts[i].left = off.dx;
                        });
                      },
                    ),
                  ),
                ),
              creatorText.text.isNotEmpty
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        creatorText.text,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.3)),
                      ))
                  : const SizedBox.shrink(),
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

  //Widget get _appBar =>
}
