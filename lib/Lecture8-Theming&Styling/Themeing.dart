
import 'package:courses_codes/Lecture8-Theming&Styling/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            headline6: MyTextStyles.headline6,
            headline5: MyTextStyles.headline5,
            button: MyTextStyles.button,
          ),
          inputDecorationTheme: InputDecorationTheme(
              filled: true, fillColor: MyColors.smoothGreen),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))),
          cardTheme: CardTheme(
              color: Color(0xFF4D6658),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          appBarTheme: AppBarTheme(
            elevation: 0,
          ),
          scaffoldBackgroundColor: MyColors.smoothBackground,
          fontFamily: "Merriweather",
          colorScheme: ColorScheme.light(
            primary: MyColors.redCaramel,
            secondary: MyColors.greenGrass,
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes & Style'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56.0),
              child: Card(
                  child: SizedBox(
                width: 250,
                height: 200,
                child: Center(
                  child: Text(
                    'Flutter Course',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 30),
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  filled: true,
                  hintText: 'Enter your Email',
                  labelText: 'Email ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye_sharp),
                  filled: true,
                  hintText: 'Enter your Email',
                  labelText: 'Password ',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
