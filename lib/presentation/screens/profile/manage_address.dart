import 'package:flutter/material.dart';

class ManageAddress extends StatelessWidget {
  const ManageAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Manage Address'),
      ),
      body: const Center(
        child: Text('Manage Address'),
      ),
    );
  }
}