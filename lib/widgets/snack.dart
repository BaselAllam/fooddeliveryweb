import 'package:flutter/material.dart';


SnackBar snack(String title, Color color) {
  return SnackBar(
    backgroundColor: color,
    content: Text('$title'),
    duration: Duration(seconds: 4),
  );
}