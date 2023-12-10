import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Todo.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(InitialState()) {
    on<GetTodosEvent>(_getTodo);
  }

  _getTodo(GetTodosEvent event, Emitter<ApiStates> emit) async {
    emit(LoadingState());

    try {
      List<Todo> todos = await getTodos();
      emit(SuccessTodoState(todos));
    } catch (e) {
      print(e);
      emit(ErrorState());
    }
  }

  Future<List<Todo>> getTodos() async {
    List<Todo> todo = [];
    print("connect to internet");
   await Future.delayed(Duration(seconds: 3),(){

    });
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
