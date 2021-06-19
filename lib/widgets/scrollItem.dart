import 'package:flutter/material.dart';



class ScrollItem extends StatefulWidget {

  final String title;
  final Color color;
  final IconData icon;
  final bool isStores;

  ScrollItem(this.title, this.color, this.icon, this.isStores);

  @override
  _ScrollItemState createState() => _ScrollItemState();
}

class _ScrollItemState extends State<ScrollItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: widget.color,
      ),
      alignment: widget.isStores == false ? Alignment.center : Alignment.bottomRight,
      margin: EdgeInsets.all(10.0),
      child: widget.isStores == false ? ListTile(
        leading: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(widget.icon, color: Colors.black, size: 35),
        ),
        title: Text(
          '${widget.title}',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Find best restaurants near your location with best quality',
          style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
      ) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '${widget.title}',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}