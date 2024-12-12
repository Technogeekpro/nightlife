import 'package:flutter/material.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookMarks'),
      ),
      body: const Center(
        child: Text('BookMarks'),
      ),
    );
  }
}