import 'dart:convert';

import 'package:bluepad_prework/models/home_model.dart';
import 'package:bluepad_prework/utils/requests.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ChangeNotifier{

  List<ImageModel> images=[];
  bool loading=true;
  int page=1;

  Future<void> getImages()async{

    Response response=await getData(page);
    if(response.statusCode==200){
      final responseData=json.decode(response.body);
      responseData.forEach((item){
        images.add(ImageModel.fromJson(item));
      });
      page+=1;
      loading=false;
      notifyListeners();
    }
  }

  Future<void> logout()async{
    await _logoutprivate();
  }

  Future<void> _logoutprivate()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedin');
  }

}