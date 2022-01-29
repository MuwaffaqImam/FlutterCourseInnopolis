import 'package:flutter/cupertino.dart';
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

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.favorite),
        title: const Text('Welcome Flutter'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return Container(
        padding: EdgeInsets.all(20),
        child:
            /*******************--[focus here 🧐]--*******************/

            Container(
              color: Colors.blueGrey,
              height: 300,
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.share, size: 50, color: Colors.cyan,),
                  Icon(Icons.comment, size: 50, color: Colors.green,),
                  Icon(Icons.favorite, size: 50, color: Colors.blue,),
                  Icon(Icons.delete_outline_rounded, size: 50, color: Colors.red,),
                ],
              ),
            )

        /*******************--[focus here 🧐]--*******************/
        );
  }

  Text textQuiz() {
    return Text(
      'Mul',
      style: TextStyle(
          color: Colors.cyan,
          backgroundColor: Colors.yellow,
          fontSize: 50,
          fontFamily: 'casual',
          fontStyle: FontStyle.italic),
    );
  }

  Text textExample() {
    return Text(
      "I am a text",
      style: TextStyle(
          fontSize: 40,
          color: Colors.blue,
          fontFamily: 'monospace',
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
          letterSpacing: 4,
          backgroundColor: Colors.black12),
    );
  }
}
