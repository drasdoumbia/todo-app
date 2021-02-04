import 'package:json_annotation/json_annotation.dart';

part 'todos.g.dart';

@JsonSerializable()
class TodoObject {
  final List<Todo> data;
  const TodoObject(this.data);

  factory TodoObject.fromJson(Map<String, dynamic> json) =>
      _$TodoObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TodoObjectToJson(this);
}

@JsonSerializable()
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
