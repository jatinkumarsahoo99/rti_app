
import 'dart:async';

import 'package:flutter/material.dart';

import '../data/model/UserDetails.dart';
import '../utils/secure_storage.dart';

class UserDetailsProvider extends ChangeNotifier{
  UserDetails? userDetails;

  Future<dynamic> getUserDetailsFromLocalStorage() async {
    Completer completer = Completer<dynamic>();
    try {
      Map<String,dynamic>? jsonData = await getUserDetails();
      if (jsonData != null) {
        userDetails = UserDetails.fromJson(jsonData);
        notifyListeners();
        completer.complete("");
      }else{

      }
    }catch(e){
      debugPrint(">>>>>>>>jks$e");
      userDetails = null;
      completer.complete("");
    }
    return completer.future;
  }


}