import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AddUserScreenT extends StatefulWidget {
  static getRoutes() {
    return PageRouteBuilder(pageBuilder: (_, __, ___) => AddUserScreenT());
  }

  @override
  State<AddUserScreenT> createState() => _AddUserScreenTState();
}

class _AddUserScreenTState extends State<AddUserScreenT> {
  bool isLoading = false;

  TextEditingController genderController = TextEditingController(text: "male");

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add user screen"),
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
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                filled: true,
                hintText: "Enter your email",
                label: Text("Email"),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: genderController,
              decoration: InputDecoration(
                icon: Icon(Icons.group),
                filled: true,
                hintText: "Enter your Gender",
                label: Text("Gender"),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            if (!isLoading)
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: () {
                    addUser(
                        name: nameController.text,
                        email: emailController.text,
                        gender: genderController.text,
                        context: context);
                  },
                  child: Text("add user".toUpperCase())),
            ),
            if (isLoading)
              Align(
                alignment: Alignment.topRight,
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    );
  }

  void addUser(
      {required context,
      required String name,
      required String email,
      String gender = "male"}) async {

    setState(() {
      isLoading = true;
    });

   await Future.delayed(Duration(seconds: 3),(){});
    String url = "https://gorest.co.in/public/v2/users";
    print("Connecting to $url");
    String accessToken =
        "ed0645c09baf75ccb7b21afc0af41ab01f0770fd90e831d5295fab6c77d96965";

    Response response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer $accessToken",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "name": "$name",
          "email": "$email",
          "gender": "$gender",
          "status": "active"
        }));

    print(response.body);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("User Added Successfully"),
        action: SnackBarAction(
          textColor: Colors.amber,
          label: "OK",
          onPressed: () {},
        ),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error happened while adding user"),
        action: SnackBarAction(
          textColor: Colors.redAccent,
          label: "OK",
          onPressed: () {},
        ),
      ));
    }

    setState(() {
      isLoading = false;
    });
  }


}
