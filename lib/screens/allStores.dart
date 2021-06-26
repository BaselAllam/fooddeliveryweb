import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/demodata.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/storeitem.dart';

class AllStores extends StatefulWidget {
  @override
  _AllStoresState createState() => _AllStoresState();
}

class _AllStoresState extends State<AllStores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Stores', style: headLineFontStyle),
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
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: sellerData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                StoreItem(
                  sellerData[index]!['storesImages'],
                  sellerData[index]!['storeTitle'],
                  sellerData[index]!['storesSubTitle'],
                  MediaQuery.of(context).size.width / 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
