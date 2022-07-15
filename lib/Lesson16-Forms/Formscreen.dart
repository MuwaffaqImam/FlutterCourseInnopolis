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

class _FormPageState extends State<FormPage>{

  final _formKey = GlobalKey<FormState>();

  String _fullName = "";

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data successfully saved')),
      );
    }
  }

  final _nameFieldController = TextEditingController();

  void _onNameTextChanged(){
    setState(() {
      _fullName = _nameFieldController.text;
      print(_fullName);
    });
  }

  @override
  void initState() {
    super.initState();
    _nameFieldController.addListener(_onNameTextChanged);
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    super.dispose();
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
                      onChanged: (text){
                        print(text);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Full Name",
                        suffixIcon: Icon(
                            Icons.person
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      controller: _nameFieldController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "flutter@innopolis.ru",
                          helperText: "Use Innopolis email address",
                          labelText: "Email",
                          helperStyle: TextStyle(
                              fontSize: 14
                          ),
                          errorStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.red
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!value.endsWith("@innopolis.ru")){
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone number",
                          helperStyle: TextStyle(
                              fontSize: 14
                          )
                      ),
                      keyboardType: TextInputType.phone,
                      enableSuggestions: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        helperText: "At least 8 characters",
                        labelText: "Password",
                        helperStyle: TextStyle(
                            fontSize: 14
                        ),
                        prefixIcon: Icon(
                            Icons.password_rounded
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      enableSuggestions: false,
                      obscureText: true,
                      autocorrect: false,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(" Hi $_fullName", style: const TextStyle(fontSize: 24),),
                      )
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}