import 'package:courses_codes/templates/templatesLabs/Lab5Copy/bloc/api_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Todo.dart';
import 'bloc/api_bloc.dart';
import 'bloc/api_states.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
      home: BlocProvider(
        create: (_) => ApiBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  Widget buildBloc() {
    return BlocBuilder<ApiBloc, ApiStates>(builder: (context, state) {
      if (state is ErrorState) {
        return Text("Error");
      }
      if (state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is SuccessTodoState) {
        List<Todo> todo = state.todos;
        return buildUserList(todo);
      }
      return buildInitialView();
    });
  }

  Center buildInitialView() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            /// call bloc and send event
            context.read<ApiBloc>().add(GetTodosEvent());
          },
          child: Text("Get TODO".toUpperCase())),
    );
  }

  Widget buildUserList(List<Todo> todo) {
    return ListView.builder(
      itemCount: todo.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(todo[index].title),
      ),
    );
  }
}
