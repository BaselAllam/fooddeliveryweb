import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/demodata.dart';
import 'package:fooddeliveryweb/models/mainmodel.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/scrollItem.dart';
import 'package:fooddeliveryweb/widgets/searchButton.dart';
import 'package:scoped_model/scoped_model.dart';

class PopularServices extends StatefulWidget {
  @override
  _PopularServicesState createState() => _PopularServicesState();
}

class _PopularServicesState extends State<PopularServices> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
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
            actions: [SearchButton()],
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
          ),
          backgroundColor: Colors.grey[100],
          body: Container(
            margin: EdgeInsets.all(10.0),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: model.allServices.length,
              itemBuilder: (context, index) {
                if(model.allServices.isEmpty) {
                  return Center(child: Text('no services found', style: headLineFontStyle));
                }else{
                return ScrollItem(
                    model.allServices[index].serviceName, model.allServices[index].img, true);
                }
              },
            ),
          ),
        );
      }
    );
  }
}
