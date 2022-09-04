import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
            accentColor: Colors.lightBlue,
          )),
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
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.android_sharp),
          title: const Text('Flutter course'),
          elevation: 4,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  counter++;
                  setState(() {});
                },
                child: Icon(
                  Icons.thumb_up,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  splashColor: Colors.blue,
                  onLongPress: () {
                    counter = 0;
                    setState(() {});
                  },
                  onTap: () {
                    counter++;
                    setState(() {});
                  },
                  onDoubleTap: () {
                    counter += 2;
                    setState(() {});
                  },
                  child: Text(
                    '$counter',
                    style: TextStyle(
                        fontSize: 50,
                        color: counter >= 10 ? Colors.red : Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  counter--;
                  setState(() {

                  });
                },
                child: Icon(
                  Icons.thumb_down,
                  size: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ));
  }
}

