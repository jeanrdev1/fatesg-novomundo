import 'package:authentication_app/domain/entity/login_dto.dart';
import 'package:authentication_app/domain/service/auth_service.dart';
import 'package:authentication_app/view/task_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthService authService = AuthService();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    validate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
            ),
            TextField(
              controller: passwordController,
            ),
            ElevatedButton(
              onPressed: () => login(),
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }

  validate() async {
    if (await authService.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TaskView(),
        ),
      );
    }
  }

  login() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      bool result = await authService.actionLogin(LoginDTO(
          username: usernameController.text,
          password: passwordController.text));
      if (result) {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const TaskView(),
            ),
            (route) => false);
      }
    }
  }
}
