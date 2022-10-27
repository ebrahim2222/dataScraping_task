import 'package:flutter/material.dart';

class Constants {
  static const String appFont = "Montserrat";
  static const String appColor = "#54328E";
  static getScreenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static getScreenHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}
