import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/screens/restaurantdetails.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';

class StoreItem extends StatefulWidget {
  final String image;
  final String title;
  final String category;
  final double width;

  StoreItem(this.image, this.title, this.category, this.width);

  @override
  _StoreItemState createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  bool isEntered = false;

  @override
  Widget build(BuildContext context) {
    // inkwell widget that uses to make any widget is as a button
    return MouseRegion(
      onEnter: (x) {
        setState(() {
          isEntered = true;
        });
      },
      onExit: (x) {
        setState(() {
          isEntered = false;
        });
      },
      child: InkWell(
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
                    backgroundImage: NetworkImage(widget.image),
                  ),
                  title: Text('${widget.title}', style: headLineFontStyle),
                  subtitle: Text('${widget.category}', style: sublineFontStyle),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('  10 : 50 KM', style: sublineFontStyle),
                    Text(isEntered == false ? '4.9 Rating  ' : 'See Menu...',
                        style: isEntered == false
                            ? sublineFontStyle
                            : TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
