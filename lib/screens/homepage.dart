import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/demodata.dart';
import 'package:fooddeliveryweb/models/mainmodel.dart';
import 'package:fooddeliveryweb/screens/allStores.dart';
import 'package:fooddeliveryweb/screens/favscreen.dart';
import 'package:fooddeliveryweb/screens/popularServices.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/scrollItem.dart';
import 'package:fooddeliveryweb/widgets/searchButton.dart';
import 'package:fooddeliveryweb/widgets/storeitem.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {

final MainModel model;

HomePage(this.model);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
void initState() {
  widget.model.getOffers();
  widget.model.getStores();
  widget.model.getServices();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
        appBar: AppBar(
          title: Text('Welcome', style: headLineFontStyle),
          backgroundColor: Colors.grey[100],
          actions: [
            SearchButton(),
            IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.teal,
              iconSize: 25.0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {return FavScreen();}));
              },
            ),
          ],
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
                  itemCount: model.allOffers.length,
                  itemBuilder: (context, index) {
                    if(model.isGetOfferLoading == true) {
                      return Center(child: CircularProgressIndicator());
                    }else if(model.allOffers.isEmpty) {
                      return Center(child: Text('Sorry no offers found', style: headLineFontStyle));
                    }else{
                      return ScrollItem(
                        model.allOffers[index].offerName,
                        model.allOffers[index].img,
                        false
                      );
                    }
                  },
                ),
              ),
              headLine('Popular Stores', AllStores()),
              Container(
                height: 125.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.allStores.length,
                  itemBuilder: (context, index) {
                    if(model.isGetServiceLoading== true) {
                      return Center(child: CircularProgressIndicator());
                    }else if(model.allOffers.isEmpty) {
                      return Center(child: Text('Sorry no stores found', style: headLineFontStyle));
                    }else{
                      return StoreItem(
                        model.allStores[index],
                        300.0,
                      );
                      }
                  },
                ),
              ),
              headLine('Popular Services', PopularServices()),
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: model.allServices.length,
                  itemBuilder: (context, index) {
                    if(model.isGetServiceLoading == true) {
                      return Center(child: CircularProgressIndicator());
                    }else if(model.allOffers.isEmpty) {
                      return Center(child: Text('Sorry no services found', style: headLineFontStyle));
                    }else{
                      return ScrollItem(
                        model.allServices[index].serviceName,
                        model.allServices[index].img,
                        true
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
      }
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
