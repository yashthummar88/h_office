import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils{

  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }


  static saveUser()async{
   await  init();
   
  }



}