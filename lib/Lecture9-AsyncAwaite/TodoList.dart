import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.red, accentColor: Colors.indigo)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
      ),
      body: Column(
        children: [
          FlutterLogo(size: 200, style: FlutterLogoStyle.horizontal,),
          ElevatedButton(onPressed: () {
            fetchTodo();
          },
          child: Text("Get Todos"),),
        ],
      ),
    );
  }

   fetchTodo()  async{
    print("connect to internet");
    Response response = await http.get(Uri.https('gorest.co.in','/public/v2/todos'));
    print(response.body);
  }
}
