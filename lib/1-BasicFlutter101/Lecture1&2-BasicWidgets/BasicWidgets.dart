import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
// ignore: prefer_const_constructors
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Column(
        children: [
          myWidget(),
          textWidgetQuiz(),
          iconQuizSolution(),
          elevatedButtonQuiz(),
          iconButton(),
        ],
      ),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return Container(
        padding: EdgeInsets.all(20),
        child:
        /*******************--[focus here 🧐]--*******************/
        Text("Hello iOS, I am Flutter")
      /*******************--[focus here 🧐]--*******************/
    );
  }

  IconButton iconButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.add),
      color: Colors.redAccent,
      iconSize: 50,
      splashColor: Colors.yellowAccent,
    );
  }

  Image imageQuiz() {
    return Image.network(
      'https://i1.rgstatic.net/ii/institution.image/AS%3A294232846815242%401447161985730_l',
      height: 600,
      width: 400,
      fit: BoxFit.cover,
    );
  }

  ElevatedButton elevatedButtonQuiz() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Press me",
        style: TextStyle(
            fontSize: 18, fontFamily: "casual", color: Colors.yellowAccent),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 6,
        shape: StadiumBorder(),
        padding: EdgeInsets.only(right: 100, left: 100),
      ),
    );
  }

  Icon iconQuizSolution() {
    return Icon(
      Icons.whatshot,
      size: 200,
      color: Colors.deepOrange,
    );
  }

  Text textWidgetQuiz() {
    return const Text(
      'Your first Widget',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.teal,
          fontFamily: "casual",
          fontSize: 40,
          fontWeight: FontWeight.w700,
          backgroundColor: Colors.yellowAccent,
          letterSpacing: 4,
          fontStyle: FontStyle.italic),
    );
  }
}
