import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        builder: (ThemeData light, ThemeData dark) {
          return MaterialApp(
            home: MyHomePage(),
            theme: light,
            darkTheme: dark,
          );
        },
        initial: AdaptiveThemeMode.dark,
        dark: ThemeData(
            fontFamily: "Eczar",
            scaffoldBackgroundColor: Color(0xFF303030),
            bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
            appBarTheme: AppBarTheme(backgroundColor: Colors.black),
            iconTheme: IconThemeData(color: Colors.amberAccent),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green))),
        light: ThemeData(
          fontFamily: "Merriweather",
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.blue),
        ));
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.edit,
              color: Colors.amber,
            )),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: SizedBox(height: 56),
        ),
        appBar: AppBar(
          title: const Text('App Title'),
          elevation: 4,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh,
                size: 200,
              ),
              ElevatedButton(
                  onPressed: () {
                    AdaptiveTheme.of(context).toggleThemeMode();
                  },
                  child: Text("Toggel Theme"))
            ],
          ),
        ));
  }
}
