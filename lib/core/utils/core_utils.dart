import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  final random = Random();
  // return Color.fromARGB(
  //   255,
  final red = random.nextInt(256);
  final green = random.nextInt(256);
  final blue = random.nextInt(256);
  // );

  //Mix with white to make it pastel
  const mixAmount = 0.6; // higher = lighter color
  final r = ((red + 255 * mixAmount) / (1 + mixAmount)).round();
  final g = ((green + 255 * mixAmount) / (1 + mixAmount)).round();
  final b = ((blue + 255 * mixAmount) / (1 + mixAmount)).round();
  return Color.fromARGB(255, r, g, b);
}

bool isColorDark(Color color) {
  return ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
}