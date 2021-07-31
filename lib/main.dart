import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/models/mainmodel.dart';
import 'package:fooddeliveryweb/screens/splash.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
        home: Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}



// XD link => https://xd.adobe.com/view/1c57105d-d52f-4152-4f49-066632d6af9c-6a66/
// XD Password => Kafrawi@2020

// Store
    // Store name, distance, rating, Service, image, isFav

    // filter


// bool isPressed = false;

// Text('isPressed == false ? lkasdfnaskldnsajklasjkdsajksaa'.substring(0,10) : 'asdasdjkdffbjkadsbkajdbjkas')