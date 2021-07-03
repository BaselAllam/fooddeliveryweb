import 'package:flutter/material.dart';



OutlineInputBorder borderTheme(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 0.5),
    borderRadius: BorderRadius.circular(20.0)
  );
}