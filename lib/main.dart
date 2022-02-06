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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            style: FlutterLogoStyle.stacked,
            size: 200,
          ),
          Text('Open drawer to see our Apps'),
        ],
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
                child: FlutterLogo(
              style: FlutterLogoStyle.horizontal,
            )),
            ListTile(
              leading: Icon(Icons.view_week_sharp),
              title: Text('Bottom Navigation screen'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Login Screen'),
            ),
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Theme Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
