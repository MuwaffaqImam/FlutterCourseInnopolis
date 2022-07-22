import '../../Lecture9&10&11-AsyncAwaite/User.dart';

abstract class ApiState1 {}

class InitialState extends ApiState1 {}
class FailureState extends ApiState1 {}

class LoadingState extends ApiState1 {}

class UserListState extends ApiState1 {
  List<User> users;
  UserListState(this.users);
}
