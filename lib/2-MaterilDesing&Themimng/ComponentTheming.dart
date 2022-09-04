import 'package:flutter/material.dart';
void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: Colors.amber, elevation: 0),
          fontFamily: 'Eczar',
          cardTheme: CardTheme(
              elevation: 7,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          iconTheme: IconThemeData(color: Colors.redAccent, size: 100),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo, onPrimary: Colors.amberAccent)),
          textTheme: TextTheme(
            headline6: MyTextStyles.headline6,
            headline5: MyTextStyles.headline5,
          )),
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
      appBar: AppBar(),
      body: myWidget(context)
    );
  }

  Widget myWidget(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Headline1', style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 16),
          Card(child: SizedBox(height: 200, width: 200),),
          SizedBox(height: 16),
          Icon(Icons.bookmark,),
          SizedBox(height: 26),
          ElevatedButton(
              onPressed: () {}, child: Text('Press me'.toUpperCase())),
        ],
      ),
    );
  }
}

class MyTextStyles {
  static final String eczar = "Eczar";
  static final String merriweather = "Merriweather";

  static TextStyle headline6 = TextStyle(
    color: Colors.white,
    fontFamily: eczar,
    fontSize: 20.0,
    fontWeight: FontWeight.w900,
  );
  static TextStyle headline5 = TextStyle(
    color: Colors.red,
    fontFamily: eczar,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle button = TextStyle(
    color: Colors.red,
    fontFamily: merriweather,
    fontSize: 18.0,
    fontWeight: FontWeight.w300,
  );
}
