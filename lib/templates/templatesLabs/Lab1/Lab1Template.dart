import 'package:flutter/material.dart';

void main() => runApp(Lab1());

/// this is your APP Main screen configuration
class Lab1 extends StatelessWidget {
  Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAb1HomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class LAb1HomePage extends StatelessWidget {
  LAb1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.stars),
        title: const Text('Lab 1'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          /*******************--[focus here 🧐]--*******************/
          SizedBox(height: 25,),
          exercise1(),
          SizedBox(height: 25,),
          exercise2(),
          SizedBox(height: 25,),
          exercise3(),
          SizedBox(height: 25,),
          exercise4(),
          SizedBox(height: 25,),
          exercise5(),
          SizedBox(height: 25,),
          exercise6(),
          /*******************--[focus here 🧐]--*******************/
        ],
      ),
    );
  }

  /// TODO: Implement Exercises below as per the handed Document
  Widget exercise1() {
    return FlutterLogo(
      size: 100,
    );
  }

  Widget exercise2() {
    return FlutterLogo(
      size: 100,
    );
  }

  /// TODO : print on the screen on Pressed when clicking on the button, and print on Long Pressed when long click to Button
  Widget exercise3() {
    return FlutterLogo(
      size: 100,
    );
  }

  Widget exercise4() {
    return FlutterLogo(
      size: 100,
    );
  }

  Widget exercise5() {
    return FlutterLogo(
      size: 100,
    );
  }
  Widget exercise6() {
    return FlutterLogo(
      size: 100,
    );
  }
}