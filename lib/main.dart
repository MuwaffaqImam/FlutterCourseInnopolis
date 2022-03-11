import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
        accentColor: Colors.lightBlue,
      )),
      home: InteractiveWidget(),
    );
  }
}

class InteractiveWidget extends StatefulWidget {
  const InteractiveWidget({Key? key}) : super(key: key);

  @override
  _InteractiveWidgetState createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget> {
  double size = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: animatedContainer(),
    );
  }

  Column animatedContainer() {
    return Column(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.all(16),
          color: size > 150 ? Colors.red : Colors.blue,
          width: 100 + size,
          height: 100 + size,
          duration: Duration(milliseconds: 350),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  size += 50;
                  setState(() {});
                },
                child: Icon(
                  Icons.add,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  size -= 50;
                  setState(() {});
                },
                child: Icon(
                  Icons.remove,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
