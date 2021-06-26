import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/scrollItem.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


Map<int, Map<String, dynamic>> offersData = {
  0 : {
    'color' : Colors.red,
    'title' : 'Vegetables',
    'image' : 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  1 : {
    'color' : Colors.blue,
    'title' : 'Fruites',
    'image' : 'https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  2 : {
    'color' : Colors.green,
    'title' : 'Tomato',
    'image' : 'https://images.pexels.com/photos/704971/pexels-photo-704971.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  3 : {
    'color' : Colors.indigo,
    'title' : 'Apple',
    'image' : 'https://images.pexels.com/photos/704971/pexels-photo-704971.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  4 : {
    'color' : Colors.red,
    'title' : 'Apple',
    'image' : 'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },
  5 : {
    'color' : Colors.green,
    'title' : 'Apple',
    'image' : 'https://images.pexels.com/photos/1775043/pexels-photo-1775043.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },

};


Map<int, Map<String, dynamic>> sellerData = {
  0 : {
    'storeTitle' : 'Carefour',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'https://pbs.twimg.com/profile_images/1298913730202406912/--62gQAd.jpg'
  },
  1 : {
    'storeTitle' : 'Hyper',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpiXaNCy8bMOy9sYbTdE3AdP6-R1EQVu5qk0d57C8FKoEnBkWMM0SWHZtgPNfRCPopXk&usqp=CAU',
  },
  2 : {
    'storeTitle' : 'Mac',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'https://images.pexels.com/photos/5851368/pexels-photo-5851368.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  },
  3 : {
    'storeTitle' : 'Tomatos Salad',
    'storesSubTitle' : 'Vegetables & Fruites',
    'storesImages' : 'https://images.pexels.com/photos/5945657/pexels-photo-5945657.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },
  4 : {
    'storeTitle' : 'Carefour',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'https://pbs.twimg.com/profile_images/1298913730202406912/--62gQAd.jpg'
  },
  5 : {
    'storeTitle' : 'Hyper',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpiXaNCy8bMOy9sYbTdE3AdP6-R1EQVu5qk0d57C8FKoEnBkWMM0SWHZtgPNfRCPopXk&usqp=CAU',
  },
  6 : {
    'storeTitle' : 'Mac',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'https://images.pexels.com/photos/5851368/pexels-photo-5851368.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  },
  7 : {
    'storeTitle' : 'Tomatos Salad',
    'storesSubTitle' : 'Vegetables & Fruites',
    'storesImages' : 'https://images.pexels.com/photos/5945657/pexels-photo-5945657.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: headLineFontStyle
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          Icon(Icons.search, color: Colors.grey, size: 35.0)
        ],
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offersData.length,
                itemBuilder: (context, index){
                  return ScrollItem(
                    offersData[index]!['title'],
                    offersData[index]!['image'],
                    false
                  );
                },
              ),
            ),
            headLine('Popular Stores'),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sellerData.length,
                itemBuilder: (context, index){
                  return storesItem(sellerData[index]!['storesImages'], sellerData[index]!['storeTitle'], sellerData[index]!['storesSubTitle']);
                },
              ),
            ),
            headLine('Popular Services'),
            Container(
              height: 300.0,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.55,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: offersData.length,
                itemBuilder: (context, index){
                  return ScrollItem(
                    offersData[index]!['title'],
                    offersData[index]!['image'],
                    true
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  headLine(String title) {
    return ListTile(
      title: Text(
        '$title',
        style: headLineFontStyle
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
    );
  }
  storesItem(String image, String title, String category) {
    return Container(
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                minRadius: 20.0,
                maxRadius: 20.0,
                backgroundImage: NetworkImage(image),
              ),
              title: Text(
                '$title',
                style: headLineFontStyle
              ),
              subtitle: Text(
                '$category',
                style: sublineFontStyle
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  10 : 50 KM',
                  style: sublineFontStyle
                ),
                Text(
                  '4.9 Rating  ',
                  style: sublineFontStyle
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}