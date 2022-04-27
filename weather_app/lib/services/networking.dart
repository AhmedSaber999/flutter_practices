import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper{

  NetworkHelper(this.url);
  final Uri url;

  Future getWeatherData() async{
    var response = await http.get(url);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else{
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }

}
