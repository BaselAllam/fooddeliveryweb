import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';

class RestaurantDetails extends StatefulWidget {
  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [header()],
        ),
      ),
    );
  }

  header() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.black26, BlendMode.color)),
            ),
            alignment: Alignment.topCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconData(Icons.arrow_back_ios, () {
                    Navigator.pop(context);
                  }, 'Exit Screen'),
                  Text(
                    'Store Name',
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                  Row(
                    children: [
                      iconData(Icons.location_on, () {}, 'Location On Map'),
                      iconData(Icons.share, () {}, 'Share'),
                    ],
                  ),
                ]),
          ),
          Positioned(
            bottom: 0.0,
            left: 200.0,
            right: 200.0,
            top: 150.0,
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: ListTile(
                leading: Container(
                  height: 150.0,
                  width: 150.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://pbs.twimg.com/profile_images/1298913730202406912/--62gQAd.jpg'),
                          fit: BoxFit.fill)),
                ),
                title: Text('Store Name', style: headLineFontStyle),
                subtitle: Text('Fruites Market located in Cairo, Egypt',
                    style: sublineFontStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }

  iconData(IconData icon, Function onPressed, String message) {
    return Tooltip(
      message: message,
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        iconSize: 35.0,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
