import 'package:flutter/material.dart';

Map<int, Map<String, dynamic>> offersData = {
  0: {
    'color': Colors.red,
    'title': 'Vegetables',
    'image':
        'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  1: {
    'color': Colors.blue,
    'title': 'Fruites',
    'image':
        'https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  2: {
    'color': Colors.green,
    'title': 'Tomato',
    'image':
        'https://images.pexels.com/photos/704971/pexels-photo-704971.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  3: {
    'color': Colors.indigo,
    'title': 'Apple',
    'image':
        'https://images.pexels.com/photos/704971/pexels-photo-704971.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
  },
  4: {
    'color': Colors.red,
    'title': 'Apple',
    'image':
        'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },
  5: {
    'color': Colors.green,
    'title': 'Apple',
    'image':
        'https://images.pexels.com/photos/1775043/pexels-photo-1775043.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },
};

Map<int, Map<String, dynamic>> sellerData = {
  0: {
    'storeTitle': 'Carefour',
    'storesSubTitle': 'Super Market',
    'storesImages':
        'https://pbs.twimg.com/profile_images/1298913730202406912/--62gQAd.jpg'
  },
  1: {
    'storeTitle': 'Hyper',
    'storesSubTitle': 'Super Market',
    'storesImages':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpiXaNCy8bMOy9sYbTdE3AdP6-R1EQVu5qk0d57C8FKoEnBkWMM0SWHZtgPNfRCPopXk&usqp=CAU',
  },
  2: {
    'storeTitle': 'Mac',
    'storesSubTitle': 'Super Market',
    'storesImages':
        'https://images.pexels.com/photos/5851368/pexels-photo-5851368.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  },
  3: {
    'storeTitle': 'Tomatos Salad',
    'storesSubTitle': 'Vegetables & Fruites',
    'storesImages':
        'https://images.pexels.com/photos/5945657/pexels-photo-5945657.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },
  4: {
    'storeTitle': 'Carefour',
    'storesSubTitle': 'Super Market',
    'storesImages':
        'https://pbs.twimg.com/profile_images/1298913730202406912/--62gQAd.jpg'
  },
  5: {
    'storeTitle': 'Hyper',
    'storesSubTitle': 'Super Market',
    'storesImages':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmpiXaNCy8bMOy9sYbTdE3AdP6-R1EQVu5qk0d57C8FKoEnBkWMM0SWHZtgPNfRCPopXk&usqp=CAU',
  },
  6: {
    'storeTitle': 'Mac',
    'storesSubTitle': 'Super Market',
    'storesImages':
        'https://images.pexels.com/photos/5851368/pexels-photo-5851368.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  },
  7: {
    'storeTitle': 'Tomatos Salad',
    'storesSubTitle': 'Vegetables & Fruites',
    'storesImages':
        'https://images.pexels.com/photos/5945657/pexels-photo-5945657.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  },
};


List<String> restImages = [
  'https://images.pexels.com/photos/1484516/pexels-photo-1484516.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2263510/pexels-photo-2263510.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/3534750/pexels-photo-3534750.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2878741/pexels-photo-2878741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2670327/pexels-photo-2670327.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1843655/pexels-photo-1843655.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
];


// Google Map API Key : AIzaSyAqaJHWraBjhlTZnbc_mKNiMRqPIhQYz3Y
// Google Map API Key IOS : AIzaSyAf3EvVdlQ0rZpLcB4T4tM6mk_X1jrEfrE

// https://pub.dev/packages/google_maps_flutter
// https://pub.dev/packages/geocoding
// https://pub.dev/packages/geolocator