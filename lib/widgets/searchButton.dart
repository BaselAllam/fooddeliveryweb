import 'package:flutter/material.dart';


class SearchButton extends StatefulWidget {

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      color: Colors.teal,
      iconSize: 35.0,
      onPressed: () {},
    );
  }
}