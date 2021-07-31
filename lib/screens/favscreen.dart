import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/models/mainmodel.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/searchButton.dart';
import 'package:fooddeliveryweb/widgets/storeitem.dart';
import 'package:scoped_model/scoped_model.dart';



class FavScreen extends StatefulWidget {

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
       return Scaffold(
        appBar: AppBar(
          title: Text('Favorites Stores', style: headLineFontStyle),
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
          actions: [SearchButton()],
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
        ),
        backgroundColor: Colors.grey[100],
        body: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.allFavStores.length,
            itemBuilder: (context, index) {
              if(model.allStores.isEmpty) {
                  return Center(child: Text('no fav found', style: headLineFontStyle));
                }else{
                  return Column(
                    children: [
                      StoreItem(
                        model.allFavStores[index],
                        MediaQuery.of(context).size.width,
                      ),
                    ],
                  );
                }
            },
          ),
        ),
      );
      }
    );
  }
}