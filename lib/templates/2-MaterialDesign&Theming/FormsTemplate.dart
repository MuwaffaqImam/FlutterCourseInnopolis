import 'package:flutter/material.dart';

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
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Form")),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 24.0),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text(
                          "Login".toUpperCase(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
