import '../../Lecture9&10&11-AsyncAwaite/User.dart';

abstract class ApiStates{}

class LoadingState extends ApiStates{}
class FailureState extends ApiStates{}
class InitialState extends ApiStates{}

class SuccessUserList extends ApiStates{
  List<User> users;
  SuccessUserList(this.users);
}
