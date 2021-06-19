import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


Map<int, Map<String, dynamic>> offersData = {
  0 : {
    'color' : Colors.red,
    'title' : 'Vegetables',
    'icon' : Icons.local_offer
  },
  1 : {
    'color' : Colors.blue,
    'title' : 'Fruites',
    'icon' : Icons.restaurant_menu
  },
  2 : {
    'color' : Colors.green,
    'title' : 'Tomato',
    'icon' : Icons.shopping_basket
  },
  3 : {
    'color' : Colors.indigo,
    'title' : 'Apple',
    'icon' : Icons.shopping_cart
  },
  4 : {
    'color' : Colors.red,
    'title' : 'Apple',
    'icon' : Icons.shopping_cart
  },
  5 : {
    'color' : Colors.green,
    'title' : 'Apple',
    'icon' : Icons.shopping_cart
  },
  6 : {
    'color' : Colors.blue,
    'title' : 'Apple',
    'icon' : Icons.shopping_cart
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
    'storeTitle' : 'Spinnes',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'http://img0cf.b8cdn.com/images/logo/24/1470824_logo_1573726187_n.png',
  },
  3 : {
    'storeTitle' : 'Tomatos Salad',
    'storesSubTitle' : 'Vegetables & Fruites',
    'storesImages' : 'https://image.freepik.com/free-vector/mountain-fruits-white-background-fruit-market-store-logo-illustration_136277-486.jpg'
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
    'storeTitle' : 'Spinnes',
    'storesSubTitle' : 'Super Market',
    'storesImages' : 'http://img0cf.b8cdn.com/images/logo/24/1470824_logo_1573726187_n.png',
  },
  7 : {
    'storeTitle' : 'Tomatos Salad',
    'storesSubTitle' : 'Vegetables & Fruites',
    'storesImages' : 'https://image.freepik.com/free-vector/mountain-fruits-white-background-fruit-market-store-logo-illustration_136277-486.jpg'
  },
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.search, color: Colors.grey, size: 35.0)
        ],
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
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
                  return scrollItem(
                    offersData[index]!['title'],
                    offersData[index]!['color'],
                    offersData[index]!['icon'],
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
              height: 400.0,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.55,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: offersData.length,
                itemBuilder: (context, index){
                  return scrollItem(
                    offersData[index]!['title'],
                    offersData[index]!['color'],
                    offersData[index]!['icon'],
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
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
  scrollItem(String title, Color color, IconData icon, bool isStores) {
    return Container(
      width: 350.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
      alignment: isStores == false ? Alignment.center : Alignment.bottomRight,
      margin: EdgeInsets.all(10.0),
      child: isStores == false ? ListTile(
        leading: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.black, size: 35),
        ),
        title: Text(
          '$title',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Find best restaurants near your location with best quality',
          style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
      ) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$title',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
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
                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '$category',
                style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  10 : 50 KM',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  '4.9 Rating  ',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}