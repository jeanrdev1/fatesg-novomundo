import 'dart:convert';

import 'package:authentication_app/core/env.dart';
import 'package:authentication_app/core/storage.dart';
import 'package:authentication_app/domain/entity/login_dto.dart';
import 'package:authentication_app/domain/entity/register_dto.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class AuthService {

  Uri loginUrl = Uri.parse(Env.read('url') + '/login');
  Uri registerUrl = Uri.parse(Env.read('url') + '/register');
  Uri testUrl = Uri.parse(Env.read('url') + '/test');

  Future<bool> validate() async {
    Response response = await get(testUrl, headers: {
      'Token': Storage.read('token'),
    });
    if (response.statusCode != 200) {
      Storage.delete('token');
    }
    return response.statusCode == 200;
  }

  Future<bool> actionLogin(LoginDTO dto) async {
    Response response = await post(loginUrl, headers: {'Content-Type': 'application/json'}, body: dto.toJson(),);
    if (response.statusCode == 200) {
      Storage.save('token', jsonDecode(response.body)['token']);
      return true;
    }
    Storage.delete('token');
    return false;
  }

  Future<bool> createAccount(RegisterDTO dto) async {
    Response response = await post(registerUrl, headers: {'Content-Type': 'application/json'}, body: dto.toJson(),);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
  
}