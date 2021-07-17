import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/theme/fieldtheme.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';



Container field(String titles, String label, IconData icon, bool isSecure, TextEditingController controller, GlobalKey<FormState> key, {bool secured = true}) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: ListTile(
      title: Text(
        '$titles \n',
        style: headLineFontStyle,
      ),
      subtitle: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[100]
        ),
        child: TextFormField(
          key: key,
          validator: (value) {
            if(value!.isEmpty) {
              return 'this field required';
            }
          },
          decoration: InputDecoration(
            border: borderTheme(Colors.grey),
            focusedBorder: borderTheme(Colors.grey),
            enabledBorder: borderTheme(Colors.grey),
            disabledBorder: borderTheme(Colors.black38),
            labelText: label,
            labelStyle: sublineFontStyle,
            prefixIcon: Icon(icon, color: Colors.grey, size: 20.0),
            suffixIcon: titles == 'Password' ? IconButton(
              icon: Icon(Icons.remove_red_eye),
              color: Colors.grey,
              iconSize: 15.0,
              onPressed: () {
                secured = !secured;
              },
            ) : null,
          ),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.name,
          obscureText: titles == 'Password' ? secured : isSecure,
          controller: controller
        ),
      ),
    ),
  );
}