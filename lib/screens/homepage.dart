import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/demodata.dart';
import 'package:fooddeliveryweb/screens/allStores.dart';
import 'package:fooddeliveryweb/screens/popularServices.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/scrollItem.dart';
import 'package:fooddeliveryweb/widgets/storeitem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome', style: headLineFontStyle),
        backgroundColor: Colors.grey[100],
        actions: [Icon(Icons.search, color: Colors.grey, size: 35.0)],
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offersData.length,
                itemBuilder: (context, index) {
                  return ScrollItem(offersData[index]!['title'],
                      offersData[index]!['image'], false);
                },
              ),
            ),
            headLine('Popular Stores', AllStores()),
            Container(
              height: 125.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sellerData.length,
                itemBuilder: (context, index) {
                  return StoreItem(
                    sellerData[index]!['storesImages'],
                    sellerData[index]!['storeTitle'],
                    sellerData[index]!['storesSubTitle'],
                    300.0,
                  );
                },
              ),
            ),
            headLine('Popular Services', PopularServices()),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.55,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: offersData.length,
                itemBuilder: (context, index) {
                  return ScrollItem(offersData[index]!['title'],
                      offersData[index]!['image'], true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  headLine(String title, Widget navigatorTo) {
    return ListTile(
      title: Text('$title', style: headLineFontStyle),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return navigatorTo;
        }));
      },
    );
  }
}
