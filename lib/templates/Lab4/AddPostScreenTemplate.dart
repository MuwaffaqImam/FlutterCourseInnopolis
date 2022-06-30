import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//

class AddPostScreenTemplate extends StatefulWidget {
  /// make the screen introduce it self
  static getRoute(BuildContext context) {
    /// Exercise 4 return PageRouteBuilder to show this screen recap last lesson or search Internet if you forgot
    return MaterialPageRoute(builder: (_) => AddPostScreenTemplate());
  }

  const AddPostScreenTemplate({Key? key}) : super(key: key);

  @override
  _AddPostScreenTemplateState createState() => _AddPostScreenTemplateState();
}

class _AddPostScreenTemplateState extends State<AddPostScreenTemplate> {
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
            TextField(),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                /// Exercise 5 call addComment with Named parameter
              },
              child: Text("Add Comment".toUpperCase()),
            )
          ],
        ),
      ),
    );
  }

  addComment() {
    /// Exercise 5 call Post API here
  }
}
