import 'package:flutter/material.dart';
import 'package:image_editing_app/models/text_info.dart';
import 'package:image_editing_app/screens/edit_image_screen.dart';
import 'package:image_editing_app/widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  int currentIndex = 0;
  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(
          'Selected for styling',
          style: TextStyle(fontSize: 16),
        )));
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  incrementFontSize() {
    setState(() {
      texts[currentIndex].fontSize = texts[currentIndex].fontSize + 5;
    });
  }

  decrementFontSize() {
    setState(() {
      if (texts[currentIndex].fontSize > 10) {
        texts[currentIndex].fontSize = texts[currentIndex].fontSize - 5;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 500),
            content: Text(
              "Not allowed",
              style: TextStyle(fontSize: 16),
            )));
      }
    });
  }

  alignTextCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  alignTextLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignTextRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  boldText() {
    setState(() {
      if (texts[currentIndex].fontWeight != FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.bold;
      } else {
        texts[currentIndex].fontWeight = FontWeight.normal;
      }
    });
  }

  italicText() {
    setState(() {
      if (texts[currentIndex].fontStyle != FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.italic;
      } else {
        texts[currentIndex].fontStyle = FontStyle.normal;
      }
    });
  }

  underlineText() {
    setState(() {
      if (texts[currentIndex].textDecoration != TextDecoration.underline) {
        texts[currentIndex].textDecoration = TextDecoration.underline;
      } else {
        texts[currentIndex].textDecoration = TextDecoration.none;
      }
    });
  }

  addNewLine() {
    setState(() {
      texts[currentIndex].text = texts[currentIndex].text.replaceAll(' ', '\n');
    });
  }

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
          fontSize: 30,
          textAlign: TextAlign.left,
          textDecoration: TextDecoration.none));
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
