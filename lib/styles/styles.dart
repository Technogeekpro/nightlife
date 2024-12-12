import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'colors.dart';

class AppStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    color: AppColors.secondary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static const InputDecoration searchInputDecoration = InputDecoration(
    hintText: 'Search for clubs, bars, etc',
    hintStyle: TextStyle(color: Colors.white54),
    filled: true,
    fillColor: Color(0xff101115),
    prefixIcon: Icon(
      Iconsax.search_normal_1,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondary),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );

  static InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: AppColors.background.withOpacity(0.8),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.secondary),
        borderRadius: BorderRadius.circular(12.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}