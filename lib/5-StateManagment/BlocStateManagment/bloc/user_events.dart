abstract class UserEvent {}

class GetUserEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  String name, email, gender;
  AddUserEvent({required this.email,required this.gender,required this.name});
}
