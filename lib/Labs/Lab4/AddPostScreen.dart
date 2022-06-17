import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charcode/ascii.dart';

class AddPostScreen extends StatefulWidget {
  /// make the screen introduce it self
  static getRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionsBuilder: (_, animation, secondAnimation, child) {
      /// add your animation here
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }, pageBuilder: (_, __, ___) {
      return new AddPostScreen();
    });
  }

  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController titleController = TextEditingController(text: 'test title');
  TextEditingController commentController = TextEditingController(text: 'comment');

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
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                filled: true,
                hintText: 'write title here...',
                labelText: 'title ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              maxLines: 5,
              controller: commentController,
              decoration: const InputDecoration(
                icon: Icon(Icons.comment),
                filled: true,
                hintText: 'write Comment here',
                labelText: 'Comment',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  addComment(title: titleController.text, comment: commentController.text);
                },
                child: Text("Add Comment".toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addComment({
    required String title,
    required String comment,
  }) async {
    var response =
        await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
            headers: {
              "Content-Type": "application/json; charset=UTF-8",
            },
            body: jsonEncode({
              "title": "$title",
              "body": "$comment",
              "userId": 1,
            }));

    print(response.body);
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Comment Added')));
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error ${response.body}')));
  }
}
