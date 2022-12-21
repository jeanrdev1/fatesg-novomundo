import 'package:authentication_app/core/env.dart';
import 'package:authentication_app/core/storage.dart';
import 'package:authentication_app/domain/entity/task.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class TaskService {
  
  Uri taskUrl = Uri.parse(Env.read('url') + '/task');

  Future<List<Task>> findAll() async {
    Response response = await get(taskUrl, headers: {
      'Token': Storage.read('token'),
    });
    if (response.statusCode == 200) {
      return Task.fromJsonList(response.body);
    }
    return [];
  }

}
