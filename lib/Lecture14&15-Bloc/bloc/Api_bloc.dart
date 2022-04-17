import 'package:courses_codes/Lecture14&15-Bloc/data/ApiProvider.dart';
import 'package:courses_codes/Lecture14&15-Bloc/bloc/Api_events.dart';
import 'package:courses_codes/Lecture14&15-Bloc/bloc/Api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Lecture9&10&11-AsyncAwaite/User.dart';

class ApiBloc1 extends Bloc<ApiEvent1, ApiState1> {
  ApiBloc1() : super(InitialState()) {
    on<GetUsersEvent>(_getUserList);
  }

  _getUserList(GetUsersEvent event, Emitter<ApiState1> emits) async {
    emit(LoadingState());
    try {
      List<User> users = await ApiProvider().getUsers();
      emit(UserListState(users));
    } catch (error) {
      print(error);
    }
  }
}
