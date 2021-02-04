library json_parser;

export "post_parser.dart";
export "todo_parser.dart";
export "object_decoder.dart";

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parserFromJson(String json);
}
