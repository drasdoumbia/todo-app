// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoObject _$TodoObjectFromJson(Map<String, dynamic> json) {
  return TodoObject(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TodoObjectToJson(TodoObject instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
    json['userId'] as int,
    json['id'] as int,
    json['title'] as String,
    json['completed'] as bool,
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
