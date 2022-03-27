import 'dart:convert';
import 'package:courses_codes/Labs/Lab4/AddPostScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'Post.dart';

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
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddPostScreen.getRoute(context));
        },
        child: Icon(Icons.add_comment_sharp),
      ),
      body: posts.isEmpty ? buildEmptyView() : buildUserList(),
    );
  }

  Widget buildEmptyView() {
    return FutureBuilder<List<Post>>(
        future: getUsers(),
        builder: (context, snapshot) {
          // on Error
          if (snapshot.hasError) {
            return Text("Error");
          }
          // on Finish
          if (snapshot.connectionState == ConnectionState.done) {
            posts = snapshot.data!;
            return buildUserList();
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Future<List<Post>> getUsers() async {
    List<Post> usersList =[];
    print("connect to internet");
    Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((json) {
        print(json);
        usersList.add(Post.fromJson(json));
      });
      return usersList;
    }
    return [];
  }

  Widget buildUserList() {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.comment_rounded),
                title: Text("${posts[index].title}",style: TextStyle(fontSize: 18),),
                subtitle: Text("${posts[index].body}"),
              ),
              Divider()
            ],
          );
        });
  }
}
