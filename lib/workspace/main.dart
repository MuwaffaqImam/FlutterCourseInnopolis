import 'package:courses_codes/Labs/lab5-Theming/style.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        appBarTheme: AppBarTheme(color: Colors.amber,elevation: 0),
        scaffoldBackgroundColor: Colors.black,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary:Colors.indigo,onPrimary: Colors.amber)),
          iconTheme: IconThemeData(color: Colors.redAccent, size: 100),
          cardTheme: CardTheme(
              elevation: 6,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          fontFamily: 'Eczar',
         ),
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
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(),
      body: myWidget(context),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Headline2', style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 16),
          Card(child: SizedBox(height: 200, width: 200),),
          SizedBox(height: 16),
          Icon(Icons.bookmark,),
          Icon(Icons.whatshot,),
          SizedBox(height: 26),
          ElevatedButton(onPressed: () {}, child: Text('Press me'.toUpperCase())),
        ],
      ),
    );
  }
}
