import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/field.dart';



class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

bool secured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome', style: headLineFontStyle),
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width/2.5,
          height: MediaQuery.of(context).size.height/1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '\nWelcome Let\'s Login',
                  style: TextStyle(color: Colors.teal, fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    height: 170,
                    width: MediaQuery.of(context).size.width/2.5 / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.pexels.com/photos/4394612/pexels-photo-4394612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        fit: BoxFit.fill
                      ),
                      shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
              Field('User Name', 'User Name', Icons.account_circle, false),
              Field('Password', 'Password', Icons.lock, secured),
            ],
          ),
        ),
      ),
    );
  }
}