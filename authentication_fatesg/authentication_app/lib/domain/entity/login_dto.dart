// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginDTO {

  final String username;

  final String password;
  
  LoginDTO({
    required this.username,
    required this.password,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());

}
