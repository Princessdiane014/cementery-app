import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const CemeteryApp());
}

class CemeteryApp extends StatelessWidget {
  const CemeteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
