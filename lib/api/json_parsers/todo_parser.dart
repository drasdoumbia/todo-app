import '../models/todos.dart';

import 'object_decoder.dart';
import 'json_parser.dart';

class TodoParser extends JsonParser<List<Todo>> with ListDecoder<List<Todo>> {
  const TodoParser();

  @override
  Future<List<Todo>> parserFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => Todo.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
