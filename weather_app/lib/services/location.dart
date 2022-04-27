// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

class Location{


  Future<Position?> getCurrentLocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      return position;
    }
    catch(e){
      print(e);
    }
    return null;
  }
}