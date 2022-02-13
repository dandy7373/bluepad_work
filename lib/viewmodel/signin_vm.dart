import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninViewModel extends ChangeNotifier{
  bool success=false;
  bool loggedin=false;
  bool wait=true;

  Future<void> setCreds()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedin', true);
  }

  Future<void> signin()async{
    await setCreds();
    this.success=true;
    notifyListeners();
  }

  Future<void> isLoggedin()async{
    final prefs = await SharedPreferences.getInstance();
    final bool? loginStatus=prefs.getBool('loggedin');
    if(loginStatus==null?false:true){
      loggedin=true;
    }
    wait=false;
    notifyListeners();
  }

  void logout(){
    loggedin=false;
    notifyListeners();
  }

  

  

}