import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../Lecture9&10&11-AsyncAwaite/User.dart';


class ApiProvider {

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