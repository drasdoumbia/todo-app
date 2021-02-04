import 'package:flutter/material.dart';
import 'package:todo_app/widgets/fetch_error_widget.dart';

import '../api/http_client.dart';
import '../api/models/todos.dart';
import '../api/json_parsers/todo_parser.dart';

class FetchDataPage extends StatefulWidget {
  @override
  _FetchDataPageState createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  Future<List<Todo>> todos;

  @override
  void initState() {
    super.initState();

    todos = RequestREST(endpoint: "/todos")
        .executeGet<List<Todo>>(const TodoParser());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: todos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data ?? [];

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var todo = data[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: todo.completed
                            ? Row(
                                children: [
                                  Text("🟢"),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    child: Text(todo.title,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Text("🟡"),
                                  SizedBox(width: 5.0),
                                  Expanded(child: Text(todo.title)),
                                ],
                              ),
                      ),
                      Divider(
                        color: Colors.cyan,
                      ),
                    ],
                  ),
                );
              },
            );
          }

          if (snapshot.hasError) {
            return FetchErrorWidget();
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
