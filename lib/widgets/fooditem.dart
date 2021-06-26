import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';



class FoodItem extends StatefulWidget {

  final String image;
  final String title;

  FoodItem(this.image, this.title);
  
  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.fill
              ),
            ),
          ),
          ListTile(
            leading: Text(
              widget.title,
              style: headLineFontStyle
            ),
            subtitle: Text(
              '20 \$',
              style: priceFontStyle
            ),
            trailing: Icon(
              Icons.add_shopping_cart,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}