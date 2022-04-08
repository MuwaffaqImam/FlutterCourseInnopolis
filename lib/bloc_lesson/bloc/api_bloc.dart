import 'dart:convert';

import 'package:courses_codes/Lecture14&15-Bloc/bloc/Api_events.dart';
import 'package:courses_codes/bloc_lesson/bloc/api_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../Lecture9&10&11-AsyncAwaite/User.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(InitialState()) {
    on<GetUserListEvent>(_getUserList);
  }

  _getUserList(GetUserListEvent event, Emitter<ApiStates> emitter) async {
    try {
      emitter(LoadingState());
      List<User> users = await getUsers();
      emitter(SuccessUserList(users));
    }catch(e){
      print(e);
      emitter(FailureState());
    }
  }

  Future<List<User>> getUsers() async {
    List<User> usersList = [];
    print("connect to internet");
    Response response =
        await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((json) {
        print(json);
        usersList.add(User.fromJson(json));
      });
      return usersList;
    }
    return [];
  }
}
