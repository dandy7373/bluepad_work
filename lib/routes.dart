
import 'package:bluepad_prework/screens/home.dart';
import 'package:bluepad_prework/screens/signin.dart';
import 'package:flutter/material.dart';

const sigin='/signin';
const home='/home';


Route<dynamic> controller(RouteSettings settings){
  switch(settings.name){
    case sigin:
      return MaterialPageRoute(builder: (context)=>Signin());
    case home:
      return MaterialPageRoute(builder: (context)=>Home());
    default:
      throw('No route debug ');
  }
}
