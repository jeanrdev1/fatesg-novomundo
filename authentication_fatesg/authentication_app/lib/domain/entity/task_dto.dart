import 'dart:convert';

class TaskDTO {
	final String title;
  final String description;

  TaskDTO({
    required this.title,
    required this.description,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());
}
