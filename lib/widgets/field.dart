import 'package:flutter/material.dart';
import 'package:fooddeliveryweb/theme/fieldtheme.dart';
import 'package:fooddeliveryweb/theme/fontTheme.dart';



class Field extends StatefulWidget {

final String titles;
final String label;
final IconData icon;
bool isSecure;

Field(this.titles, this.label, this.icon, this.isSecure);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {

bool secured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(
          '${widget.titles} \n',
          style: headLineFontStyle,
        ),
        subtitle: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey[100]
          ),
          child: TextField(
            decoration: InputDecoration(
              border: borderTheme(Colors.grey),
              focusedBorder: borderTheme(Colors.grey),
              enabledBorder: borderTheme(Colors.grey),
              disabledBorder: borderTheme(Colors.black38),
              labelText: widget.label,
              labelStyle: sublineFontStyle,
              prefixIcon: Icon(widget.icon, color: Colors.grey, size: 20.0),
              suffixIcon: widget.titles == 'Password' ? IconButton(
                icon: Icon(Icons.remove_red_eye),
                color: Colors.grey,
                iconSize: 15.0,
                onPressed: () {
                  setState(() {
                    secured = !secured;
                  });
                },
              ) : null,
            ),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
            obscureText: widget.titles == 'Password' ? secured : widget.isSecure,
          ),
        ),
      ),
    );
  }
}