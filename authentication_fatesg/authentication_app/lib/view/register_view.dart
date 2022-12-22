import 'package:authentication_app/domain/entity/register_dto.dart';
import 'package:authentication_app/domain/service/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: usernameController,
            ),
            TextField(
              controller: passwordController,
            ),
            ElevatedButton(
              onPressed: () => register(),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  register() async {
    if (nameController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      if (await authService.createAccount(
        RegisterDTO(
          name: nameController.text,
          username: usernameController.text,
          password: passwordController.text,
        ),
      )) {
        Navigator.pop(context);
      }
    }
  }
}
