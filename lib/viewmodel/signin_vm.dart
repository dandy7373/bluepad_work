import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninViewModel extends ChangeNotifier{
  bool success=false;
  bool loggedin=false;
  bool wait=true;

  Future<void> setCreds(String data)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedin', true);
    await prefs.setString('userdata', data);
  }

  Future<void> signin(Map<String,dynamic> data)async{
    await setCreds(json.encode(data));
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