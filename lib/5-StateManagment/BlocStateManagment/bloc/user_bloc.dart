import 'dart:async';
import 'dart:math';

import '../data/UserProvider.dart';

import '../bloc/user_events.dart';
import '../bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
  UsersBloc() : super(InitialState()) {
    on<GetUserEvent>(_getUserList);
    on<AddUserEvent>(_addUser);
  }

  FutureOr<void> _getUserList(
      GetUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());
    try {
      List<User> user = await ApiProvider().getUsers();
      emit(SuccessUserList(user, false));
    } catch (error) {
      print(error);
      emit(FailureState());
    }
  }

  FutureOr<void> _addUser(AddUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());
    try {
      bool isCreated = await ApiProvider()
          .postUser(name: event.name, gender: event.gender, email: event.email);
      if (isCreated)
        emit(SuccessCreatedUser());
      else
        emit(FailureState());
    } catch (error) {
      print(error);
      emit(FailureState());
    }
  }
}
