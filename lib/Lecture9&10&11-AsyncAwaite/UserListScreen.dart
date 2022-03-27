import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'AddUserScreen.dart';
import 'User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  bool change = true;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddUserScreen.getRoute(context));
        },
        child: Icon(Icons.person_add),
      ),
      body: users.isEmpty ? buildEmptyView() : buildUserList(),
    );
  }

  Widget buildEmptyView() {
    return FutureBuilder<List<User>>(
        future: getUsers(),
        builder: (context, snapshot) {
          // on Error
          if (snapshot.hasError) {
            return Text("Error");
          }
          // on Finish
          if (snapshot.connectionState == ConnectionState.done) {
            users = snapshot.data!;
            return buildUserList();
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Future<List<User>> getUsers() async {
    List<User> usersList =[];
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

  Widget buildUserList() {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 5), () {});
      },
      child: RefreshIndicator(
        onRefresh: () {
          return Future.value(true);
        },
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("${users[index].name}"),
                subtitle: Text("${users[index].email}"),
              );
            }),
      ),
    );
  }
}
