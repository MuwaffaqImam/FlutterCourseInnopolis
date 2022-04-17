import 'dart:convert';
import 'package:courses_codes/Lecture14&15-Bloc/bloc/Api_bloc.dart';
import 'package:courses_codes/Lecture14&15-Bloc/bloc/Api_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../Lecture9&10&11-AsyncAwaite/AddUserScreen.dart';
import '../../Lecture9&10&11-AsyncAwaite/User.dart';
import '../bloc/Api_state.dart';

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
      home: BlocProvider(
        create: (BuildContext context) => ApiBloc1(),
        child: MyHomePage(),
      ),
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
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  Widget buildBloc() {
    return BlocBuilder<ApiBloc1, ApiState1>(builder: (context, state) {
      if (state is InitialState)
        return Center(
          child: ElevatedButton(
              onPressed: () {
                context.read<ApiBloc1>().add(GetUsersEvent());
              },
              child: Text("Get Users".toUpperCase())),
        );
      if (state is FailureState)
        return Center(child: Text("Error"));
      else if (state is LoadingState)
        return Center(child: CircularProgressIndicator());
      else if (state is UserListState) {
        print("hi");
        users = state.users;
        return buildUserList(state.users);
      } else
        return Text("Not Reachable");
    });
  }

  Widget buildUserList(List<User> users) {
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
