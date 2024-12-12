import 'package:flutter/material.dart';

class NavigationHelper {
  static void to(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }
}