import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Lab 3',style:TextStyle(fontSize:18),),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 450),
        width: screenWidth,
        height: isOpened ? 60 : screenHeight,
        color: Colors.indigo,
        child: Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isOpened = !isOpened;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          'Click to Expand',
                          style: TextStyle(fontSize: 18),
                        )),
                    Icon(isOpened
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top : 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    changeColors(screenWidth),
                    changeColors(screenWidth),
                    changeColors(screenWidth),
                    changeColors(screenWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeColors(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,
            child: Text('Change with what is requested!')),
      ),
    );
  }
}
