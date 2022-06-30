import 'dart:convert';

import 'package:courses_codes/Lecture9&10&11-AsyncAwaite/AddUserScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../templates/AddUserScreenTemplate.dart';
import 'AddUserScreen.dart';
import 'ScreenB.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {ScreenB.routeName: (context) => ScreenB()},
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> usersList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String text = "Hello Text";
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddUserLessonApi()));
          },
          child: Icon(Icons.person_add),
        ),
        body: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            // error
            if (snapshot.hasError) return Text("Error");

            // success
            if (snapshot.connectionState == ConnectionState.done)
              return createUIList();

            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  ElevatedButton createButton() {
    return ElevatedButton(
      onPressed: () {
        getUsers();
      },
      child: Text("Get Users".toUpperCase()),
    );
  }

  getUsers() async {
    Uri url = Uri.parse("https://gorest.co.in/public/v2/users");
    Response response = await http.get(url);
    // print(response.body);
    List list = json.decode(response.body) as List;
    list.forEach((element) {
      usersList.add(User.fromJson(element));
    });
  }

  Widget createUIList() {
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${usersList[index].name}',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Text(
              '${usersList[index].email}',
              style: TextStyle(fontSize: 14),
            ),
          );
        });
  }
}

class User {
  late int id;
  late String name;
  late String email;
  late String gender;
  late String status;

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    id = json["id"];
    gender = json["gender"];
    status = json["status"];
  }
}
