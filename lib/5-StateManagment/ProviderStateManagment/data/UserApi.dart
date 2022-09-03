import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserApis {
  Future<List<User>> getUsers() async {
    print("getting User List.....");
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
