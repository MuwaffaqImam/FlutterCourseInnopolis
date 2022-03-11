import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUserScreen extends StatefulWidget {
  static PageRouteBuilder getRoute() {
    return PageRouteBuilder(
      transitionsBuilder: (_, animation, secondAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (_, __, ___) {
        return AddUserScreen();
      },
    );
  }

  const AddUserScreen({Key? key}) : super(key: key);

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(text: "@gmail.com");
  TextEditingController genderController = TextEditingController(text: "Male");

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    genderController.dispose();
    super.dispose();
  }

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
                  addUser(
                      email: emailController.text,
                      gender: genderController.text,
                      name: nameController.text);
                },
                child: Text("Add User".toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addUser(
      {required String name,
      required String email,
      required String gender}) async {
    var response =
        await http.post(Uri.parse('https://gorest.co.in/public/v2/users'),
            headers: {
              "Authorization":
                  "Bearer ed0645c09baf75ccb7b21afc0af41ab01f0770fd90e831d5295fab6c77d96965",
              "Content-Type": "application/json"
            },
            body: jsonEncode({
              "name": "$name",
              "gender": "$gender",
              "email": "$email",
              "status": "active",
            }));
    if (response.statusCode == 201) {
      print(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('User Added')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error with ${response.reasonPhrase}')));
      print(response.reasonPhrase);
    }
  }
}
