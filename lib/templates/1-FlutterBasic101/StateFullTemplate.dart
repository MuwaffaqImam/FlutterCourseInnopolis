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
              ElevatedButton(onPressed: (){
                   // TODO: Increase the counter here

              }, child: Icon(Icons.add),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                // TODO long press on text rest counter
                child: Text(
                  '0',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black),
                ),
              ),
    
               ElevatedButton(onPressed: (){
                // TODO: Decrease the counter here

              }, child: Icon(Icons.remove),)
            ],
          ),
        ));
  }
}

