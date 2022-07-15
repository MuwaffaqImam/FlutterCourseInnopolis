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
            'Total hours to finis ${todos.fold<int>(0, (previousValue, element) => previousValue + element.hours)}',
            style: TextStyle(fontSize: 24, fontFamily: 'Eczar')),
        Wrap(
          spacing: 8,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    todos = todos
                        .where((element) => element.priority == "h")
                        .toList();
                  });
                },
                child: Chip(label: Text("Filter by h"),backgroundColor: Colors.greenAccent,)),
            InkWell(
                onTap: () {
                  setState(() {
                    todos = todos
                        .where((element) => element.priority == "m")
                        .toList();
                  });
                },
                child: Chip(label: Text("Filter by m"),backgroundColor: Colors.amberAccent)),
            InkWell(
                onTap: () {
                  setState(() {
                    todos =
                        todos.expand((element) => [element, element]).toList();
                  });
                },
                child: Chip(label: Text("duplicate"),backgroundColor: Colors.redAccent)),
            InkWell(
                onTap: () {
                  setState(() {
                    todos = todosOriginal;
                  });
                },
                child: Chip(label: Text("clear"),backgroundColor: Colors.purpleAccent)),

          ],
        ),
        Divider(),
        Expanded(
          child: ListView(
            children: todos
                .map((e) => Column(
                      children: [
                        ListTile(
                          title: Text(e.name,
                              style:
                                  TextStyle(fontSize: 24, fontFamily: 'Eczar')),
                          subtitle: Text('Hours to complete ${e.hours}'),
                          leading: Icon(Icons.list),
                          trailing: Text(
                            e.priority.toUpperCase(),
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Eczar',
                                color: Colors.purple),
                          ),
                        ),
                        Divider()
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
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
