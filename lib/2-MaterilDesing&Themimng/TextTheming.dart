
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            headline1: MyTextStyles.headline1,
            headline2: MyTextStyles.headline2,
            headline3: MyTextStyles.headline3,
            headline4: MyTextStyles.headline4,
            headline5: MyTextStyles.headline5,
            headline6: MyTextStyles.headline6,
            subtitle1: MyTextStyles.subtitle,
            bodyText1: MyTextStyles.body,
            button: MyTextStyles.button,
            caption: MyTextStyles.caption,
            overline: MyTextStyles.button,
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
      child: ListView(
        children: [
          Text('Headline1', style: Theme.of(context).textTheme.headline1),
          Text('Headline2', style: Theme.of(context).textTheme.headline2),
          Text('Headline3', style: Theme.of(context).textTheme.headline3),
          Text('Headline4', style: Theme.of(context).textTheme.headline4),
          Text('Headline5', style: Theme.of(context).textTheme.headline5),
          Text('Headline6', style: Theme.of(context).textTheme.headline6),
          Text('Subtitle', style: Theme.of(context).textTheme.subtitle1),
          Text('Body', style: Theme.of(context).textTheme.bodyText2),
          TextButton(onPressed: () {  }, child: Text('button', style: Theme.of(context).textTheme.button)),
          Text('Caption', style: Theme.of(context).textTheme.caption),
          Text('Overline', style: Theme.of(context).textTheme.overline),

        ],
      ),
    );
  }
}

class MyTextStyles {
  static final String eczar = "Eczar";
  static final String merriweather = "Merriweather";


  static TextStyle headline1 = TextStyle(
    color: Colors.amber,
    fontFamily: eczar,
    fontSize: 96.0,
    fontWeight: FontWeight.w700,
  );


  static TextStyle headline2 = TextStyle(
    color: Colors.green,
    fontFamily: eczar,
    fontSize: 60.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headline3 = TextStyle(
    color: Colors.indigo,
    fontFamily: eczar,
    fontSize: 48.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headline4 = TextStyle(
    color: Colors.green,
    fontFamily: eczar,
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headline5 = TextStyle(
    color: Colors.red,
    fontFamily: eczar,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );


  static TextStyle headline6 = TextStyle(
    color: Colors.pink,
    fontFamily: merriweather,
    fontSize: 20.0,
    fontWeight: FontWeight.w900,
  );


  static TextStyle subtitle = TextStyle(
    fontFamily: merriweather,
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
  );

  static TextStyle body = TextStyle(
    fontFamily: merriweather,
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
  );


  static TextStyle button = TextStyle(
    color: Colors.blueAccent,
    fontFamily: merriweather,
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
  );


  static TextStyle caption = TextStyle(
    color: Colors.deepPurpleAccent,
    fontFamily: merriweather,
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
  );

  static TextStyle overline = TextStyle(
    color: Colors.teal,
    fontFamily: merriweather,
    fontSize: 10.0,
    fontWeight: FontWeight.w300,
  );





}
