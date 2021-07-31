import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/demodata.dart';
import 'package:fooddeliveryweb/screens/allReviews.dart';
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
      bottomSheet: InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            'Order Now',
            style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
            color: Colors.teal,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 45.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            header(),
            moreItem(
              'Users Reviews \n',
              Text(
                '* * * *',
                style: TextStyle(color: Colors.yellow, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              '133 Review',
              () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {return AllReviews();}));
              }
            ),
            divider(),
            moreItem(
              'Cairo, Egypt \n ',
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 25.0,
                  ),
                  Text(
                    ' 6 : 15 KM Near',
                    style: sublineFontStyle,
                  ),
                ],
              ),
              'See on Map',
              () {}
            ),
            divider(),
            moreItem(
              'Open Now \n',
              Text(
                '6:00 AM to 10:00 PM',
                style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              'See Times',
              () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(
                            'Opening Hours',
                            style: headLineFontStyle,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.close),
                            color: Colors.black,
                            iconSize: 20.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      content: Container(
                        height: MediaQuery.of(context).size.height/1.5,
                        width: MediaQuery.of(context).size.width/1.5,
                        child: ListView(
                          children: [
                            dialogItem('Friday', '10:00 AM to 10:00 PM'),
                            divider(),
                            dialogItem('Saturday', '10:00 AM to 10:00 PM'),
                            divider(),
                            dialogItem('Sunday', '10:00 AM to 10:00 PM'),
                            divider(),
                            dialogItem('Monday', '10:00 AM to 10:00 PM'),
                            divider(),
                            dialogItem('Tuesday', '10:00 AM to 10:00 PM'),
                            divider(),
                            dialogItem('Wednesday', '10:00 AM to 10:00 PM'),
                            divider(),
                            dialogItem('Thursday', '10:00 AM to 10:00 PM'),
                          ],
                        ),
                      ),
                    );
                  }
                );
              }
            ),
            divider(),
            Text(
              '   Photos',
              style: headLineFontStyle,
            ),
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          restImages[index],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
            height: MediaQuery.of(context).size.height / 3.0,
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
            bottom: 25.0,
            left: 25.0,
            right: 25.0,
            top: 200.0,
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: ListTile(
                leading: Container(
                  height: 100.0,
                  width: 100.0,
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

  moreItem(String titleTxt, Widget subTitle, String trailingTxt, Function onTaps) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        title: Text(
          titleTxt,
          style: headLineFontStyle,
        ),
        subtitle: subTitle,
        trailing: SizedBox(
          width: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                trailingTxt,
                style: sublineFontStyle,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20.0,
              ),
            ],
          ),
        ),
        onTap: () {
          onTaps();
        },
      ),
    );
  }
  divider() {
    return Divider(
      color: Colors.grey,
      endIndent: 50.0,
      indent: 50.0,
    );
  }
  dialogItem(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: headLineFontStyle,
      ),
      subtitle: Text(
        subtitle,
        style: sublineFontStyle,
      ),
    );
  }
}
