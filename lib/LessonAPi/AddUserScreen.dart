import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AddUserLessonApi extends StatefulWidget {
  const AddUserLessonApi({Key? key}) : super(key: key);

  @override
  _AddUserLessonApiState createState() => _AddUserLessonApiState();
}

class _AddUserLessonApiState extends State<AddUserLessonApi> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
                      name: nameController.text,
                      gender: "Male",
                      email: emailController.text);
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
      required String gender,
      required String email}) async {
    String accessToken =
        "ed0645c09baf75ccb7b21afc0af41ab01f0770fd90e831d5295fab6c77d96965";
    var uri = "https://gorest.co.in/public/v2/users";
    var body = {
          "name": "$name",
          "gender": "male",
          "email": "$email",
          "status": "active",
        };
    print("Sending request to $uri \n with body $body");
    Response resp = await http.post(
        Uri.parse(uri),
        headers: {
          "Authorization": "Bearer $accessToken",
          "Content-Type": "application/json"
        },
        body: jsonEncode(body));
    print(resp.body);
    print(resp.statusCode);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('User Added')));
  }
}
