import 'package:flutter/material.dart';


void main() => runApp(MyApp());


/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:Colors.teal,
          accentColor: Colors.deepOrangeAccent
        )
      ),
      home: MyHomePage(
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {  },),
      appBar: AppBar(
        title: const Text('Understanding Flutter'),
      ),
      body: Center(
          child: Column(
            children: [
              FlutterLogo(style: FlutterLogoStyle.horizontal, size: 150,),
              FlutterLogo(style: FlutterLogoStyle.horizontal, size: 150,),
              FlutterLogo(style: FlutterLogoStyle.horizontal, size: 150,),
            ],
          )),
    );
  }
}

