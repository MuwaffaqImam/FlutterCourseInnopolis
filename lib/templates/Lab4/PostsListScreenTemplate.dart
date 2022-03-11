import 'dart:convert';
import 'package:courses_codes/Labs/Lab4/AddPostScreen.dart';
import 'package:courses_codes/templates/Lab4/AddPostScreenTemplate.dart';
import 'package:flutter/material.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
              accentColor: Colors.blueGrey)),
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
      body: buildEmptyView()
    );
  }

  Widget buildEmptyView() {
    return Center(
      child: ElevatedButton(onPressed: (){
        getPosts();
      }, child: Text('press me')),
    );
  }

   getPosts()  {
   ///Exercise 1 call API here
  }

   buildUserList() {
    /// Exercise 3 implement the ListView.builder() code here (search Internet if you forgot)
  }
}
