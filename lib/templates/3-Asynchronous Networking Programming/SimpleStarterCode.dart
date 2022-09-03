import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Title'),
          backgroundColor: Colors.teal,
          elevation: 4,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: getUserApi, child: Text("Get Users".toUpperCase()))
            ],
          ),
        ));
  }

  
  void getUserApi() {

  }
}
