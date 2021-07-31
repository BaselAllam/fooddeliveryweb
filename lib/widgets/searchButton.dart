import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/screens/searchResult.dart';


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
      iconSize: 25.0,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return SearchResult();}));
      },
    );
  }
}