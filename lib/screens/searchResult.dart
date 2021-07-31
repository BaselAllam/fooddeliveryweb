import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/models/mainmodel.dart';
import 'package:fooddeliveryweb/theme/fieldtheme.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/field.dart';
import 'package:fooddeliveryweb/widgets/searchButton.dart';
import 'package:fooddeliveryweb/widgets/storeitem.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
                  decoration: InputDecoration(
                    border: borderTheme(Colors.grey),
                    focusedBorder: borderTheme(Colors.grey),
                    enabledBorder: borderTheme(Colors.grey),
                    disabledBorder: borderTheme(Colors.black38),
                    labelText: 'Search',
                    labelStyle: sublineFontStyle,
                    prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20.0),
                  ),
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.name,
                  controller: searchController,
                  onSubmitted: (value) {
                    model.search(value);
                  },
                ),
            leading: Tooltip(
              message: 'Exit Screen',
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Colors.grey[100],
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
          ),
          backgroundColor: Colors.grey[100],
          body: Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: model.allSearchStores.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    StoreItem(
                      model.allSearchStores[index],
                      MediaQuery.of(context).size.width,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }
    );
  }
}
