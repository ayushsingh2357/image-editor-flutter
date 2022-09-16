import 'package:flutter/material.dart';
import 'package:image_editing_app/models/text_info.dart';
import 'package:image_editing_app/screens/edit_image_screen.dart';
import 'package:image_editing_app/widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  List<TextInfo> texts = [];
  addNewText(BuildContext context) {
    setState(() {
      texts.add(TextInfo(
          text: textEditingController.text,
          left: 0,
          top: 0,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 15,
          textAlign: TextAlign.left));
      Navigator.of(context).pop();
    });
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "Add New Text",
        ),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.edit,
              ),
              filled: true,
              hintText: 'Your Text Here...'),
        ),
        actions: [
          DefaultButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.blueGrey,
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
          ),
          DefaultButton(
            onPressed: () => addNewText(context),
            color: Colors.orange,
            child: const Text(
              'Add Text',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
