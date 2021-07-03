import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/searchButton.dart';



class AllReviews extends StatefulWidget {

  @override
  _AllReviewsState createState() => _AllReviewsState();
}

class _AllReviewsState extends State<AllReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reviews', style: headLineFontStyle),
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
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage('https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                          fit: BoxFit.fill
                        ),
                        shape: BoxShape.circle
                      ),
                    ),
                    title: Text(
                      'User Name',
                      style: headLineFontStyle,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '* * * *',
                          style: TextStyle(color: Colors.yellow, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'User Review Example which what this user saied about this restaurant',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      ],
                    ),
                    trailing: Text(
                      '10 Min Ago',
                      style: sublineFontStyle,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}