import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

class AddUserScreen extends StatefulWidget {
  /// make the screen introduce it self
  static getRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionsBuilder: (_, animation, secondAnimation, child) {
          /// add your animation here
          return FadeTransition(
            opacity: animation,
            child: RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        }, pageBuilder: (_, __, ___) {
      return new AddUserScreen();
    });

    // you can add this line as a child to FadeTransition to add multiple animation
    // RotationTransition(
    //   turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
    //   child: child,
    // )
  }

  const AddUserScreen({Key? key}) : super(key: key);

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController =
  TextEditingController(text: "@gmail.com");
  TextEditingController genderController = TextEditingController(text: "male");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new user'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                filled: true,
                hintText: 'Enter your Name',
                labelText: 'Name ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                filled: true,
                hintText: 'Enter your Email',
                labelText: 'Email ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                icon: Icon(Icons.group),
                filled: true,
                hintText: 'Enter your Gender',
                labelText: 'Gender ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // postUser(name: name, gender: gender, email: email);
                },
                child: Text("Add User".toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }

  void postUser({required String name,
    required String gender,
    required String email}) async {
    var response = await http.post(
        Uri.parse(
          "https://gorest.co.in/public/v2/users",
        ),
        headers: {
          "Authorization":
          "Bearer ed0645c09baf75ccb7b21afc0af41ab01f0770fd90e831d5295fab6c77d96965",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": "$name",
          "gender": "$gender",
          "email": "$email",
          "status": "active",
        }));

    print(response.body);
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('User Added')));
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error ${response.body}')));
  }
}
