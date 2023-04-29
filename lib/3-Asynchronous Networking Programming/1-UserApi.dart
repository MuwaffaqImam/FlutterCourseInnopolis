import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Title'),
          backgroundColor: Colors.teal,
          elevation: 4,
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: getUserApi, child: Text("Get Users"))
          ],
        ));
  }

  void getUserApi() async {
    var response =
        await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    print(response.body);
  }
}





