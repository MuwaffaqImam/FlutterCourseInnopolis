import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
      home: MyArtApp(),
    );
  }
}

class MyArtApp extends StatefulWidget {
  MyArtApp({Key? key}) : super(key: key);

  @override
  State<MyArtApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyArtApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase"),
      ),
      body: FutureBuilder(
        /// Initialize FlutterFire:
        future: getArt(),
        builder: (context, snapshot) {
          /// if Error
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          /// On completion
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(child: Text('${snapshot.data}'));
          }

          /// On Loading
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 3,
          ));
        },
      ),
    );
  }

  Future<String> getArt() async {
    await Future.delayed(Duration(seconds: 3), () {});
    return Future.value("Finished");
  }
}
