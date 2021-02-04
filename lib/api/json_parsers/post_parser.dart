import '../models/post.dart';
import 'object_decoder.dart';
import 'json_parser.dart';

class PostParser extends JsonParser<Post> with ObjectDecoder<Post> {
  const PostParser();

  @override
  Future<Post> parserFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Post.fromJson(decoded);
  }
}
