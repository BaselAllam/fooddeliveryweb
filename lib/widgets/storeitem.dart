import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/models/mainmodel.dart';
import 'package:fooddeliveryweb/models/stores/storemodel.dart';
import 'package:fooddeliveryweb/screens/restaurantdetails.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:scoped_model/scoped_model.dart';

class StoreItem extends StatefulWidget {
  
  StoreModel store;
  final double width;

  StoreItem(this.store, this.width);

  @override
  _StoreItemState createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return RestaurantDetails();
            }));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      minRadius: 20.0,
                      maxRadius: 20.0,
                      backgroundImage: NetworkImage(widget.store.img),
                    ),
                    title: Text('${widget.store.storeName}', style: headLineFontStyle),
                    subtitle: Text('${widget.store.service}', style: sublineFontStyle),
                    trailing: IconButton(
                      icon: Icon(widget.store.isFav == true ? Icons.favorite : Icons.favorite_border),
                      color: Colors.red,
                      iconSize: 20.0,
                      onPressed: () {
                        if(widget.store.isFav == true) {
                          model.removeFromFav(widget.store);
                        }else{
                          model.addToFav(widget.store);
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('  10 : 50 KM', style: sublineFontStyle),
                      Text('4.9 Rating  ',
                          style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),
          ),
      );
      }
    );
  }
}
