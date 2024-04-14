import 'dart:convert';
import 'dart:math';

import 'package:courses_codes/3-Asynchronous%20Networking%20Programming/4-AddUserScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHorizental = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddUserScreen.getRoute(context));
        },
        child: Icon(Icons.person_add),
      ),
      appBar: AppBar(
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Center(
        child: FutureBuilder(
          future: getUserApi(),
          builder: (context, snapshot) {
            // on error
            if (snapshot.hasError) return Text("Error retriving Users");

            // on success
            if (snapshot.connectionState == ConnectionState.done) {
              List<User> userList = snapshot.data as List<User>;
              return buildUserList(userList);
            }
            // on waiting
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void changeLogoStyle() async {
    String value = await getFuture(null).onError((error, stackTrace) {
      print(error);
      return "Sorry Error Happend";
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("$value")));
    setState(() {
      isHorizental = !isHorizental;
    });
  }

  Future<String> getFuture(value) async {
    await Future.delayed(Duration(seconds: 2));
    if (value == null) throw Exception();
    return Future.value("I'm data retured from future is $value");
  }

  Future<List<User>> getUserApi() async {
    await Future.delayed(Duration(seconds: 1));
    print("Connecting to Internet");
    http.Response response =
        await http.get(Uri.parse("https://gorest.co.in/public/v2/users"));

    final jsonArray = json.decode(response.body) as List;

    List<User> userList = [];
    jsonArray.forEach((json) {
      User user = User.fromJson(json);
      userList.add(user);
    });

    return userList;
  }

  buildUserList(List<User> userList) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                    title: Text(userList[index].name!,style: TextStyle(fontFamily: "Eczar"),),
                    trailing: userList[index].status == "active"
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                    subtitle: Text(userList[index].email!),
                    leading: userList[index].gender == "male"
                        ? Icon(
                            Icons.male,
                            color: Colors.indigo,
                          )
                        : Icon(
                            Icons.female,
                            color: Colors.pink,
                          )),
                Divider()
              ],
            ));
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  User();

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    gender = json["gender"];
    status = json["status"];
    id = json["id"];
  }
}
