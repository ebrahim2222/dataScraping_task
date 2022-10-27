import 'dart:convert';
import "package:flutter/services.dart" as rootBundle;

class ReadJson {
  static Future<Map<String, dynamic>> readJson() async {
    final jsonData =
        await rootBundle.rootBundle.loadString("jsonFolder/result.json");
    final result = json.decode(jsonData) as Map<String, dynamic>;

    return result;
  }
}
