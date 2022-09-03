import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('App Title'),
          backgroundColor: Colors.teal,
          elevation: 4,
        ),
        body: Column(
          children: [
            Card(
              child:
                  SizedBox(width: 200, height: 200, child: Text("Im a card"),),
            ),
          ],
        ));
  }
}
