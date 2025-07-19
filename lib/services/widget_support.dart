import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AppWidget{
  static TextStyle headlineTextstyle(double size){
    return TextStyle(
      fontSize: size,
      color: Colors.black,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle normalTextstyle(double size){
    return TextStyle(
        fontSize: size,
        color: Colors.black,
        fontWeight: FontWeight.w500
    );
  }
  static TextStyle whiteTextstyle(double size){
    return TextStyle(
        fontSize: size,
        color: Colors.white,
        fontWeight: FontWeight.bold
    );
  }
  static TextStyle greenTextstyle(double size){
    return TextStyle(
        fontSize: size,
        color: Colors.green,
        fontWeight: FontWeight.bold
    );
  }
}