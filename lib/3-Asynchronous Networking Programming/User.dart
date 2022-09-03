class User {
  late int id;
  late String name;
  late String email;
  late String status;
  late String gender;


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    gender = json['gender'];
  }
}
