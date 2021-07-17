import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/models/global.dart';
import 'package:fooddeliveryweb/screens/homepage.dart';
import 'package:fooddeliveryweb/screens/signup.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/field.dart';
import 'package:fooddeliveryweb/widgets/snack.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

bool secured = true;

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          margin: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white
          ),
          child: Form(
            key: formKey,
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
                      height: 150,
                      width: MediaQuery.of(context).size.width/2,
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
                field('User Name', 'User Name', Icons.account_circle, false, userNameController, userNameKey),
                field('Password', 'Password', Icons.lock, secured, passwordController, passwordKey),
                SizedBox(height: 50,),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if(!formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                        }else{
                          saveToLocal('username', userNameController.text);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return HomePage();}));
                        }
                      },
                      child: Container(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width/2.5 / 2,
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {return Signup();}));
                    },
                    child: Text(
                      '\nDon\'t Have an Account   SignUp',
                      style: TextStyle(color: Colors.teal, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}