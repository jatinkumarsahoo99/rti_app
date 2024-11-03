import 'package:flutter_secure_storage/flutter_secure_storage.dart';

  const _secureStorage = FlutterSecureStorage();

  //Save Token Securely
  Future<void> saveToken(String token) async{
    await _secureStorage.write(key: 'accessToken', value: token);
  }

  //Retrieve token securely
  Future<String?> getToken() async{
    return await _secureStorage.read(key: 'accessToken');
  }
