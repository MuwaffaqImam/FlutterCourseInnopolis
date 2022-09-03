import 'package:flutter/material.dart';

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
  List<Todo> todos = [];
  List<Todo> todosOriginal = [];

  @override
  void initState() {
    createListToDos();
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
      body: myWidget(),
    );
  }

  Widget myWidget() {
    return Column(
      children: [
        Text(
            'Total hours to finis ${calulateTotalHours()}',
            style: TextStyle(fontSize: 24, fontFamily: 'Eczar')),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  filterBy("h");
                },
                child: Chip(
                  label: Text("Filter by H"),
                  backgroundColor: Colors.greenAccent,
                )),
            InkWell(
                onTap: () {
                  filterBy("m");
                },
                child: Chip(
                    label: Text("Filter by M"),
                    backgroundColor: Colors.amberAccent)),
            InkWell(
                onTap: () {
                  duplicate();
                },
                child: Chip(
                    label: Text("Duplicate"),
                    backgroundColor: Colors.redAccent)),
            InkWell(
                onTap: () {
                  depricate();
                },
                child: Chip(
                    label: Text("Depricate"),
                    backgroundColor: Colors.indigoAccent)),
            InkWell(
                onTap: () {
                  clearFilter();
                },
                child: Chip(
                    avatar: Icon(Icons.close),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    label: Text("Clear"),
                    backgroundColor: Colors.purpleAccent)),
          ],
        ),
        Divider(),
        Expanded(
          child: ListView(
            children: [
              Text("Use map to create the list, Sugar!")
            ]
          ),
        ),
      ],
    );
  }

  int calulateTotalHours() {
    return -100;
  }

  void filterBy(String filter) {
    
  }

  void duplicate() {
   
  }

  void clearFilter() {
   
  }

   depricate() {
   
  }

  void createListToDos() {
    todos.add(Todo("create lesson ", "h", 2, true));
    todos.add(Todo("break ", "l", 1, false));
    todos.add(Todo("Talk to relatives ", "m", 1, false));
    todos.add(Todo("play Horizon ", "l", 2, false));
    todos.add(Todo("Grade IP ", "h", 2, false));
    todos.add(Todo("Teach Flutter ", "h", 3, false));
    todos.add(Todo("Grade SWP ", "h", 1, false));
    todosOriginal.addAll(todos);
  }


}

class Todo {
  String name;
  String priority;
  int hours;
  bool isCompleted;

  Todo(this.name, this.priority, this.hours, this.isCompleted);
}
