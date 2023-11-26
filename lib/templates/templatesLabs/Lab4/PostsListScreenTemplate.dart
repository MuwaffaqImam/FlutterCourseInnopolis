import 'dart:convert';
import 'package:flutter/material.dart';
import 'AddPostScreenTemplate.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal, accentColor: Colors.blueGrey)),
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
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, AddPostScreenTemplate.getRoute(context));
          },
          child: Icon(Icons.add_comment_sharp),
        ),
        body: posts.isEmpty ? buildEmptyView() : buildUserList());
  }

  Widget buildEmptyView() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            getPosts();
          },
          child: Text('press me')),
    );
  }

  getPosts() async {
    ///Exercise 1 call API here
  }

  buildUserList() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Text("Hello");
      },
    );
  }
}

class Post {

}
