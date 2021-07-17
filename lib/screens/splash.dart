import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/models/global.dart';
import 'package:fooddeliveryweb/screens/homepage.dart';
import 'package:fooddeliveryweb/screens/login.dart';


class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

String? userName;

@override
void initState() {
  Timer(
    Duration(seconds: 8),
    () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        if(userName == null) {
          return Login();
        }else{
          return HomePage();
        }
      }));
    }
  );
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://st3.depositphotos.com/3038577/36024/v/950/depositphotos_360243044-stock-illustration-emblem-funny-pizza-courier-helmet.jpg',
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width/1.5,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
  checkUserData() async {

    String _userName = await getFromLocal('username');

    setState(() {
      userName = _userName;
    });
  }
}