import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {


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
                  // addUser();
                },
                child: Text("Add User".toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addUser(){

  }
}
