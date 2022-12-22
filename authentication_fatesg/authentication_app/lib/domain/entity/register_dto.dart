// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterDTO {
  
  final String name;

  final String username;

  final String password;

  RegisterDTO({
    required this.name,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}