import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Card(
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
                Text('4.9 Rating  ', style: sublineFontStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
