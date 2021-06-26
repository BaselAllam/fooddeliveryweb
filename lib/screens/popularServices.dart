import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/demodata.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/scrollItem.dart';

class PopularServices extends StatefulWidget {
  @override
  _PopularServicesState createState() => _PopularServicesState();
}

class _PopularServicesState extends State<PopularServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Services', style: headLineFontStyle),
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
        actions: [Icon(Icons.search, color: Colors.grey, size: 35.0)],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.55,
          ),
          itemCount: offersData.length,
          itemBuilder: (context, index) {
            return ScrollItem(
                offersData[index]!['title'], offersData[index]!['image'], true);
          },
        ),
      ),
    );
  }
}
