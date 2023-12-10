import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Todo.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(InitialState()) {
    // TODO Implement "on" function

  }

  // TODO Implement the emitter function



  Future<List<Todo>> getTodos() async {
    List<Todo> todo = [];
    print("connect to internet");
    Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((json) {
        print(json);
        todo.add(Todo.fromJson(json));
      });
      return todo;
    }
    return [];
  }
}
