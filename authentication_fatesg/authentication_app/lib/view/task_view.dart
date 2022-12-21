import 'package:authentication_app/core/storage.dart';
import 'package:authentication_app/domain/service/task_service.dart';
import 'package:authentication_app/view/login_view.dart';
import 'package:flutter/material.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TaskService taskService = TaskService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: () => logOut(), icon: const Icon(Icons.exit_to_app_rounded))],),
      body: FutureBuilder(
        future: taskService.findAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Text(
                snapshot.data![index].toString(),
              ),
            );
          }
        },
      ),
    );
  }
  
  logOut() {
    Storage.delete('token');
    Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
            (route) => false);
  }
}
