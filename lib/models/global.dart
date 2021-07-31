import 'package:shared_preferences/shared_preferences.dart';



void saveToLocal(String key, String value) async {

  SharedPreferences _save = await SharedPreferences.getInstance();
  _save.setString(key, value);
}


Future<bool> getFromLocal(String key) async {

  SharedPreferences _get = await SharedPreferences.getInstance();
  String? _value = _get.getString(key);

  if(_value == null) {
    return false;
  }else{
    return true;
  }
}


removeFromLocal(String key) async {

  SharedPreferences _remove = await SharedPreferences.getInstance();
  _remove.remove(key);
}


final String url = 'https://fooo-40945-default-rtdb.firebaseio.com';