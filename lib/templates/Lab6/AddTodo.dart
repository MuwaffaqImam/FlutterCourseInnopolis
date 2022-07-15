import 'package:flutter/material.dart';

import './ReactiveProgrammingLab.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();

  late TodoLab newTodo = TodoLab();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text("New Todo Form")),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Enter todo name',
                      helperText: 'Name should not be empty',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.label),
                      filled: true),
                  validator: (value) {
                   // TODO do validation here
                  },
                  onChanged: (value) {
                    newTodo.name = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter todo description',
                      helperText: 'Description should be less than 20',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.textsms),
                      filled: true),
                  validator: (value) {
                    // TODO do validation here
                  },
                  onChanged: (value) {
                    // TODO get values from here

                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Enter todo hours to complete',
                      helperText: 'Hours should not be 0',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.warning),
                      filled: true),
                  validator: (value) {
                    // TODO do validation here

                  },
                  onChanged: (value) {
                    // TODO get values from here
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Enter todo Priority',
                      helperText: 'Priority must be one of: High, Mid, Low',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.tag),
                      filled: true),
                  validator: (value) {
                    // TODO do validation here
                  },
                  onChanged: (value) {

                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // TODO do Form validation here

                  },
                  child: const Text('Add todo'),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
