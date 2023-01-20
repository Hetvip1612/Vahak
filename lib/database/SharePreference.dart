
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSave{
  static String user_token = 'token';

static  addStringToSF(key,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

static Future getStringValuesSF(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString(key);
  return stringValue;
}

static addIntToSF(key,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

static getIntValuesSF(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return 
  int? intValue = prefs.getInt(key);
  return intValue;
}

static addDoubleToSF(key,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key,value);
}
static getDoubleValuesSF(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return double
  double? doubleValue = prefs.getDouble(key);
  return doubleValue;
}

 static addBoolToSF(key,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key,value);
}
static getBoolValuesSF(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  bool? boolValue = prefs.getBool(value);
  return boolValue;
}
static removeValues(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Remove String
  prefs.remove(key);
  //Remove bool
  prefs.remove(key);
  //Remove int
  prefs.remove(key);
  //Remove double
  prefs.remove(key);
}
}
