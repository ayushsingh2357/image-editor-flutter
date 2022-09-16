import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editing_app/widgets/edit_image_viewmodel.dart';

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
      body: Image.file(File(widget.selectedImage)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => addNewDialog(context),
        tooltip: "Add new text",
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      ),
    );
  }
}
