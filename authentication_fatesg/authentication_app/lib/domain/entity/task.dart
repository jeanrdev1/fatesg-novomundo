// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  final int id;
	final String title;
  final String description;
  final bool done;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.done,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      done: map['done'] as bool,
    );
  }

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Task> fromJsonList(String json) {
    return jsonDecode(json).map<Task>((map) => Task.fromMap(map)).toList();
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, done: $done)';
  }
}
