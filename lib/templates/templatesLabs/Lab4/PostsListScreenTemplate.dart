import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../Labs/templates/Lab4/AddPostScreenTemplate.dart';

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
  bool isLoading = false;

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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : posts.isEmpty
                ? buildEmptyView()
                : buildUserList());
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
    //"https://jsonplaceholder.typicode.com/posts"

    setState(() {
      isLoading=true;
    });
    await Future.delayed(Duration(seconds: 3), () {});
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;

      list.forEach((json) {
        Post post = Post.fromJson(json);
        posts.add(post);
      });
      print(posts);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error!!')));
    }

    setState(() {
      isLoading = false;
    });
  }

  buildUserList() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              title: Text(posts[index].title),
              subtitle: Text(posts[index].body),
              leading: Icon(Icons.comment),
            ),
            SizedBox(
              height: 16,
            ),
            Divider()
          ],
        );
      },
    );
  }
}

class Post {
  late int userId;
  late int id;
  late String title;
  late String body;

  Post.fromJson(Map<String, dynamic> json) {
    userId = json["userId"] ?? "";
    id = json["id"] ?? "";
    title = json["title"] ?? "";
    body = json["body"] ?? "";
  }

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, title: $title} \n \n ---------- ';
  }
}
