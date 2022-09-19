import 'package:flutter/material.dart';
import 'package:image_editing_app/screens/edit_image_screen.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () async {
              XFile? file =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (file != null) {
                if (mounted) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EditImageScreen(selectedImage: file.path)));
                }
              }
            },
            icon: const Icon(
              Icons.upload,
            )),
      ),
    );
  }
}
