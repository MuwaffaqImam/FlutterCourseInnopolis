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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double size = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.android_sharp),
          title: const Text('Flutter course'),
          elevation: 4,
        ),
        body: counterQuiz()
    );
  }

  Center counterApp() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            child: Icon(
              Icons.add,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '$counter',
              style: TextStyle(
                  fontSize: 50,
                  color: counter >= 10 ? Colors.red : Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter -= 1;
              });
            },
            child: Icon(
              Icons.remove,
            ),
          ),
        ],
      ),
    );
  }


  Center counterQuiz() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(onTap: (){
            setState(() {
              counter += 1;
            });
          },child: Icon(Icons.thumb_up,size: 100,color: Colors.blue,)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '$counter',
              style: TextStyle(
                  fontSize: 50,
                  color: counter >= 10 ? Colors.red : Colors.black),
            ),
          ),
          InkWell(onTap: (){
            setState(() {
              counter -= 1;
            });
          },child: Icon(Icons.thumb_down,size: 100, color: Colors.red,)),
        ],
      ),
    );
  }


  Column animatedContainer() {
    return Column(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.all(16),
          color: size > 120 ? Colors.red : Colors.lightBlue,
          width: 100 + size,
          height: 100 + size,
          duration: Duration(milliseconds: 450),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    size += 5;
                  });
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
                  setState(() {
                    size -= 5;
                  });
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
