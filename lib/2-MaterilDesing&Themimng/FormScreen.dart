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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Logging with aocunt ${_emailController.text}')),
      );
    }
  }
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
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          filled: true,
                          icon: Icon(Icons.email),
                          border: UnderlineInputBorder(),
                          hintText: "flutter@innopolis.ru",
                          helperText: "Use Innopolis email address",
                          labelText: "Email",
                          helperStyle: TextStyle(fontSize: 14),
                          errorStyle:
                              TextStyle(fontSize: 16, color: Colors.red)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!value.endsWith("@")) {
                          return 'Please enter university email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: true,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        enableSuggestions: false,
                        obscureText: isObscure,
                        autocorrect: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          helperText: "At least 8 characters",
                          labelText: "Password",
                          helperStyle: TextStyle(fontSize: 14),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            child: Icon(isObscure
                                ? Icons.remove_red_eye
                                : Icons.lock_open),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }

                          if (value.length < 7)
                            return "Password lenght should be at least 8 characters";

                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: _submitForm,
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
