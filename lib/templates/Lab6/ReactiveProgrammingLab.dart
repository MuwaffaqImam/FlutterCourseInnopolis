import 'package:flutter/material.dart';

import './AddTodo.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// list of todos
  List<TodoLab> todos = initialTodos;
  List<TodoLab> todosOriginal = initialTodos;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // TODO go to the AddTodo() and get the new todo object from it
        },
        child: const Icon(Icons.add),
      ),
      body: myWidget(),
    );
  }

  Widget myWidget() {
    return Column(
      children: [
        Text(
            'Total hours to finis X',
            style: TextStyle(fontSize: 24, fontFamily: 'Eczar')),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: [
            InkWell(
                onTap: () {
                  // TODO do duplicate todos here
                },
                child: Chip(
                    label: Icon(Icons.copy_sharp),
                    backgroundColor: Colors.purpleAccent)),
            InkWell(
                onTap: () {
                  // TODO do sort ascending todos here
                },
                child: Chip(
                    label: Icon(Icons.sort),
                    backgroundColor: Colors.amberAccent)),
            InkWell(
                onTap: () {
                  // TODO do sort descending todos here
                },
                child: Chip(
                    label: Icon(Icons.sort_by_alpha_rounded),
                    backgroundColor: Colors.deepOrangeAccent)),
            InkWell(
                onTap: () {
                  // TODO do obfuscate ascending todos here

                },
                child: Chip(
                    label: Icon(Icons.remove_red_eye_rounded),
                    backgroundColor: Colors.tealAccent)),
            InkWell(
                onTap: () {
                  //TODO make all hours to complete 0, all properties to low and uppercase the title

                },
                child: Chip(
                    label: Icon(Icons.music_off),
                    backgroundColor: Colors.lightBlueAccent)),
            InkWell(
                onTap: () {
                  // TODO display first 3  todos here

                },
                child: Chip(
                    label: Text('First 3'),
                    backgroundColor: Colors.limeAccent)),
            InkWell(
                onTap: () {
                  // TODO display last 3  todos here

                },
                child: Chip(
                    label: Text('Last 3'),
                    backgroundColor: Colors.deepPurpleAccent)),
            InkWell(
                onTap: () {
                  // TODO filter todos by high here
                },
                child: Chip(
                  label: Text('High'),
                  backgroundColor: Colors.redAccent,
                )),
            InkWell(
                onTap: () {
                  // TODO filter todos by low here
                },
                child: Chip(
                    label: Text("Low"), backgroundColor: Colors.greenAccent)),
            InkWell(
                onTap: () {
                  // TODO clear filter
                },
                child: Chip(
                    label: Text("Clear Filter"),
                    backgroundColor: Colors.indigoAccent)),
          ],
        ),
        Divider(),
        buildList(),
      ],
    );
  }

  Expanded buildList() {
    // TODO build the list of todos here using map
    return Expanded(
        child: Text('build list here'),
      );
  }



}

class TodoLab {
  String name;
  String description;
  String priority;
  int hours;
  TodoLab({this.name='',
      this.description = "", this.priority = "low", this.hours = 1});
}

List<TodoLab> initialTodos = [
  TodoLab(name: "Flutter Lecture", priority: "high", hours: 3),
  TodoLab(name: "Flutter Lab", priority: "high", hours: 3),
  TodoLab(name: "DevOps Assignments",
      description: "Labs 7 & 8", priority: "low", hours: 2),
  TodoLab(name: "Gym", hours: 2),
  TodoLab(name: "Basketball", description: "Basketball outdoor area, 4pm"),
  TodoLab(name: "Game Night",
      description: "Play Valorant with friends", priority: "mid", hours: 1),
];

