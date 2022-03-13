import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  bool isOpened = true;
  bool change = true;
  bool showHideState = true;
  int logoType = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Lab 3',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 450),
        width: screenWidth,
        //  opened  = Screen height,  closed =60
        height: isOpened ? screenHeight : 60,
        color: Colors.indigo,
        child: Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  setState(() {
                    // false -> !false -> true
                    isOpened = !isOpened;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      'Click to Expand',
                      style: TextStyle(fontSize: 18),
                    )),
                    Icon(
                      isOpened
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    changeShapes(screenWidth),
                    flutterChanger(screenWidth),
                    showHide(screenWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeShapes(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      change = !change;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: change ? Colors.red : Colors.blue,
                      shape: change ? BoxShape.rectangle : BoxShape.circle,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      change = !change;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: !change ? Colors.red : Colors.blue,
                      shape: !change ? BoxShape.rectangle : BoxShape.circle,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget flutterChanger(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                flutterLogo(),
                IconButton(
                  onPressed: () {
                    logoType++;
                    if (logoType == 4) logoType = 1;
                    setState(() {});
                  },
                  icon: Icon(Icons.change_circle, color: Colors.purple),
                  splashColor: Colors.yellow,
                  iconSize: 40,
                ),
              ],
            )),
      ),
    );
  }

  FlutterLogo flutterLogo() {
    if (logoType == 1)
      return FlutterLogo(
        size: 100,
        style: FlutterLogoStyle.markOnly,
      );
    else if (logoType == 2)
      return FlutterLogo(
        size: 100,
        style: FlutterLogoStyle.horizontal,
      );
    else
      return FlutterLogo(
        size: 100,
        style: FlutterLogoStyle.stacked,
      );
  }

  Widget showHide(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          width: width,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: showHideState,
                child: Icon(
                  Icons.favorite,
                  size: 100,
                  color: Colors.deepOrange,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    showHideState = !showHideState;
                  });
                },
                icon: Icon(
                  showHideState
                  ?
                  Icons.lock_open
                  :
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                ),
                splashColor: Colors.yellow,
                iconSize: 50,
              ),
            ],
          )),
    );
  }
}
