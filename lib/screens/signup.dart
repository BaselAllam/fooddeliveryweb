import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/models/global.dart';
import 'package:fooddeliveryweb/models/mainmodel.dart';
import 'package:fooddeliveryweb/screens/homepage.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';
import 'package:fooddeliveryweb/widgets/field.dart';
import 'package:fooddeliveryweb/widgets/snack.dart';
import 'package:scoped_model/scoped_model.dart';


class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

bool secured = true;

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

String gender = '';

DateTime birthDate = DateTime(1960);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
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
                      '\nWelcome Let\'s Create Account',
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
                        alignment: Alignment.center,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            color: Colors.teal,
                            iconSize: 25.0,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext cotnext) {
                                  return Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Add a Picture',
                                          style: headLineFontStyle,
                                        ),
                                        item(
                                          'From Camera',
                                          '',
                                          Icon(Icons.camera, color: Colors.teal, size: 20.0),
                                        ),
                                        item(
                                          'From Gallery',
                                          '',
                                          Icon(Icons.album, color: Colors.teal, size: 20.0),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              );
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                  field('User Name', 'User Name', Icons.account_circle, false, userNameController, userNameKey),
                  field('Password', 'Password', Icons.lock, secured, passwordController, passwordKey),
                  field('Confirm Passwrod', 'Password', Icons.lock, secured, confirmPasswordController, confirmPasswordKey),
                  item(
                    'Gender',
                    gender,
                    PopupMenuButton(
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            child: Text('Male'),
                            value: 'Male',
                          ),
                          PopupMenuItem(
                            child: Text('FeMale'),
                            value: 'FeMale',
                          ),
                        ];
                      },
                      onSelected: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  item(
                    'Date of Birth',
                    '${birthDate.toString().substring(0, 10)}',
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      color: Colors.grey,
                      iconSize: 25.0,
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(1960),
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2015),
                        );
                        setState(() {
                          birthDate = pickedDate!;
                        });
                      }
                    ),
                  ),
                  SizedBox(height: 50,),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if(!formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                          }else if(passwordController.text != confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(snack('Password not Matched', Colors.red));
                          }else{
                            saveToLocal('username', userNameController.text);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return HomePage(model);}));
                          }
                        },
                        child: Container(
                          height: 45.0,
                          width: MediaQuery.of(context).size.width/2 / 2,
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Signup',
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
                ],
              ),
            ),
          ),
        ),
      );
      }
    );
  }
  item(String title, String subtitle, Widget trailing) {
    return ListTile(
      title: Text(
        '$title',
        style: headLineFontStyle
      ),
      subtitle: Text(
        '$subtitle',
        style: sublineFontStyle,
      ),
      trailing: trailing
    );
  }
}



int sum() {

  return 10 + 20;
}

sum1() {

  return 10 + 20;
}


Future<int> sum2() async {
  
  int x = await 10 + 20;

  return x + 30;
}


sum3() async {
  
  int x = await 10 + 20;

  return x + 30;
}