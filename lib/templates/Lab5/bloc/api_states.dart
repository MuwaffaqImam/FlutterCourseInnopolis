

import '../Todo.dart';

abstract class ApiStates{}

class LoadingState extends ApiStates{}
class FailureState extends ApiStates{}
class InitialState extends ApiStates{}

class SuccessUserList extends ApiStates{
  List<Todo> usersList;
  SuccessUserList(this.usersList);
}
