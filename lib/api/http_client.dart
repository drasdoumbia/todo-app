import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/api/json_parsers/json_parser.dart';

class RequestREST {
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({
    @required this.endpoint,
    this.data = const {},
  });

  static final _client = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: 3000,
      receiveTimeout: 3000,
      headers: <String, String>{
        "api-key": "add_one_if_needed",
      },
    ),
  );

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(endpoint);
    return parser.parserFromJson(response.data);
  }

  Future<T> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(
      endpoint,
      data: formData,
    );

    return parser.parserFromJson(response.data);
  }
}
