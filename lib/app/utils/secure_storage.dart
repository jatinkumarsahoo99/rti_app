import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _secureStorage = FlutterSecureStorage();

//Save Token Securely
Future<void> saveToken(String token) async {
  await _secureStorage.write(key: 'accessToken', value: token);
}

//Retrieve token securely
Future<String?> getToken() async {
  return await _secureStorage.read(key: 'accessToken');
}

Future<void> saveUserDetails(dynamic userDetails) async {
  // Convert userDetails to JSON string before saving
  String userDetailsJson = jsonEncode(userDetails);
  await _secureStorage.write(key: 'userDetails', value: userDetailsJson);
}

Future<dynamic> getUserDetails() async {
  String? userDetailsJson = await _secureStorage.read(key: 'userDetails');
  if (userDetailsJson != null) {
    return jsonDecode(userDetailsJson); // Convert JSON string back to Dart object
  }
  return null;
}

Future<String?> getUserFullName() async{
  String? userDetailsJson = await _secureStorage.read(key: 'userDetails');
  if(userDetailsJson != null){
    Map<String, dynamic> userDetails = jsonDecode(userDetailsJson);
    return userDetails['firstName' + 'lastName'];
  }
  return null;
}
