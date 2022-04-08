import '../../Lecture9&10&11-AsyncAwaite/User.dart';

abstract class ApiState {}

class InitialState extends ApiState {}
class FailureState extends ApiState {}

class LoadingState extends ApiState {}

class UserListState extends ApiState {
  List<User> users;

  UserListState(this.users);
}
