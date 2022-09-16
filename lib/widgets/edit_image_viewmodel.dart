import 'package:flutter/material.dart';
import 'package:image_editing_app/screens/edit_image_screen.dart';
import 'package:image_editing_app/widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();

  addNewText(BuildContext context){
    setState(() {
      
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
            onPressed: () {},
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
