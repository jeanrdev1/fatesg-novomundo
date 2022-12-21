import 'package:authentication_app/core/env.dart';
import 'package:authentication_app/core/storage.dart';
import 'package:authentication_app/view/login_view.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.loadEnv();
  await Storage.loadStorage();
  runApp(
    const MaterialApp(
      title: 'Authentication App',
      home: LoginView(),
    ),
  );
}
