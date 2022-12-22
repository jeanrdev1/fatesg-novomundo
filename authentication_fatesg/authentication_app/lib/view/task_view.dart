import 'package:authentication_app/core/storage.dart';
import 'package:authentication_app/domain/entity/task.dart';
import 'package:authentication_app/domain/entity/task_dto.dart';
import 'package:authentication_app/domain/service/task_service.dart';
import 'package:authentication_app/view/login_view.dart';
import 'package:flutter/material.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskService taskService = TaskService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => logOut(),
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: FutureBuilder(
        future: taskService.findAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => taskWidget(
                snapshot.data![index],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () => addTask(),
        child: const Icon(Icons.fingerprint_rounded),
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
      (route) => false,
    );
  }

  addTask() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20, left: 8),
                child: Text(
                  'Add Task',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Divider(height: 10),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => cancelFunction(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                        Icon(
                          Icons.close_rounded,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => saveTask(),
                    child: Row(
                      children: const [
                        Text(
                          'Save',
                          style: TextStyle(color: Colors.green),
                        ),
                        Icon(
                          Icons.check_rounded,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  taskWidget(Task task) {
    return GestureDetector(
      onDoubleTap: () => updateTaskStatus(task.id),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: task.done ? Colors.green : Colors.red),
                  )
                ],
              ),
              SizedBox(
                height: 200,
                child: Image.network(
                  task.description,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  cancelFunction() {
    titleController.clear();
    descriptionController.clear();
    Navigator.pop(context);
    setState(() {});
  }

  saveTask() async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      if (await taskService.save(
        TaskDTO(
            title: titleController.text,
            description: descriptionController.text),
      )) {
        cancelFunction();
      }
    }
  }

  updateTaskStatus(int id) async {
    if (await taskService.update(id)) {
      setState(() {});
    }
  }
}
