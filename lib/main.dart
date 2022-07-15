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
        Column(
          children: [
            Text(
              'Total hours to finish are: ${todos.fold<int>(0, (previousValue, element) => previousValue + element.hours)}',
              style: TextStyle(fontSize: 24, fontFamily: "Eczar"),
            ),
            Wrap(
              spacing: 10,
              children: [
                InkWell(
                    onTap: filterByH,
                    child: Chip(
                      label: Text("Filter by H"),
                      backgroundColor: Colors.greenAccent,
                    )),
                InkWell(
                    onTap: filterByL,
                    child: Chip(
                      label: Text("Filter by L"),
                      backgroundColor: Colors.amberAccent,
                    )),
                InkWell(
                    onTap: duplicate,
                    child: Chip(
                      label: Text("duplicate"),
                      backgroundColor: Colors.purpleAccent,
                    )),
                InkWell(
                    onTap: clear,
                    child: Chip(
                      label: Text("clear"),
                      backgroundColor: Colors.redAccent,
                    )),
              ],
            ),
          ],
        ),
        Divider(),
        Expanded(
          child: ListView(
              children: todos
                  .map((todo) => Column(
                        children: [
                          ListTile(
                            title: Text(
                              todo.name,
                              style:
                                  TextStyle(fontSize: 24, fontFamily: "Eczar"),
                            ),
                            subtitle: Text('Hours to finish ${todo.hours}',
                                style: TextStyle(fontSize: 14)),
                            trailing: Text(todo.priority.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Eczar",
                                    color: Colors.purple)),
                            leading: Icon(Icons.list),
                          ),
                          Divider()
                        ],
                      ))
                  .toList()),
        ),
      ],
    );
  }

  void createListToDos() {
    todos.add(Todo("create lesson ", "h", 2, true));
    todos.add(Todo("break ", "l", 1, false));
    todos.add(Todo("Talk to relatives ", "m", 1, false));
    todos.add(Todo("play Horizon forbidden west ", "l", 2, false));
    todos.add(Todo("Grade IP ", "h", 2, false));
    todos.add(Todo("Teach Flutter ", "h", 3, true));
    todos.add(Todo("Grade SWP ", "h", 1, false));
    todosOriginal.addAll(todos);
  }

  void filterByH() {
    setState(() {
      todos =
          todosOriginal.where((element) => element.priority == "h").toList();
    });
  }

  void filterByL() {
    setState(() {
      todos =
          todosOriginal.where((element) => element.priority == "l").toList();
    });
  }

  void clear() {
    setState(() {
      todos = todosOriginal;
    });
  }

  void duplicate() {
    setState(() {
      todos = todosOriginal.expand((element) => [element, element]).toList();
    });
  }
}

class Todo {
  String name;
  String priority;
  int hours;
  bool isCompleted;

  Todo(this.name, this.priority, this.hours, this.isCompleted);
}
