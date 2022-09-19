import 'package:flutter/material.dart';
import 'package:image_editing_app/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Image Editor',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const Homepage());
  }
}
