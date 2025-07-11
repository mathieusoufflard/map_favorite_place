import 'package:flutter/material.dart';

/// Class for creating reusable customized text widgets.
///
/// This class provides a static method to generate a [Text] widget
/// with configurable styling such as color, font size, alignment, etc.
class CustomText {

  /// Private constructor to prevent instantiation.
  CustomText._();

  /// Creates a custom-styled [Text] widget.
  ///
  /// - [text] : The text string to display.
  /// - [color] : The color of the text.
  /// - [fontSize] : The size of the font (optional).
  /// - [fontWeight] : The weight of the font (optional).
  /// - [textAlign] : The alignment of the text (optional).
  ///
  /// Returns a [Text] widget with the specified styling options.
  static customText({
    required String text,
    required Color color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}