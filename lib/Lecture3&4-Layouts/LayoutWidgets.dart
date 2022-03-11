import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: rowQuiz(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget wrapQuiz() {
    return Container(
      padding: EdgeInsets.all(20),
      child:
          /*******************--[focus here 🧐]--*******************/
      Wrap(
        spacing: 10,
        children:[
        Image.network(
          "https://wallpaperaccess.com/full/428690.jpg",
          height: 130,
          width: 150,
          fit: BoxFit.cover,
        ),
        Image.network(
          "https://wallpaperaccess.com/full/428690.jpg",
          height: 130,
          width: 150,
          fit: BoxFit.cover,
        ),
        Image.network(
          "https://wallpaperaccess.com/full/428690.jpg",
          height: 130,
          width: 150,
          fit: BoxFit.cover,
        ),
        Image.network(
          "https://wallpaperaccess.com/full/428690.jpg",
          height: 130,
          width: 150,
          fit: BoxFit.cover,
        ),
        ]
      ),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget stackQuiz() {
    return Container(
      height: 200,
      width: 300,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Image.network(
            "https://wallpaperaccess.com/full/428690.jpg",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Sunrise',
              style: TextStyle(
                  fontSize: 50, color: Colors.white, fontFamily: "cursive",backgroundColor: Colors.black45),
            ),
          )
        ],
      ),
    );
  }

  Widget aspectRationExample() {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16/9,
          child: Image.network(
            "https://wallpaperaccess.com/full/428690.jpg",
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'Sunrise',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              backgroundColor: Colors.black38),
        )
      ],
    );
  }



  Container wrapExample() {
    return Container(
      color: Colors.black12,
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        verticalDirection: VerticalDirection.up,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("1 Press me"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("2 Press me now"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("3 Press me tomorrow"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("4 Press me after 2 days"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("5 Press me next year"),
          ),
        ],
      ),
    );
  }

  Column expandedExample() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            width: 300,
            color: Colors.green,
            child: Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 30),
              ),
            )),
        Expanded(
          flex: 2,
          child: Container(
              width: 300,
              color: Colors.blue,
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(fontSize: 30),
                ),
              )),
        ),
        Expanded(
          child: Container(
              width: 300,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  '3',
                  style: TextStyle(fontSize: 30),
                ),
              )),
        ),
      ],
    );
  }

  Container rowQuiz() {
    return Container(
      color: Colors.blueGrey,
      height: 300,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.share,
            color: Colors.cyanAccent,
            size: 50,
          ),
          Icon(
            Icons.comment,
            color: Colors.greenAccent,
            size: 50,
          ),
          Icon(
            Icons.favorite,
            color: Colors.amberAccent,
            size: 50,
          ),
          Icon(
            Icons.delete,
            color: Colors.redAccent,
            size: 50,
          ),
        ],
      ),
    );
  }


  Container centerContainerQuiz() {
    return Container(
      color: Colors.yellow,
      height: 400,
      child: Center(
        child: Icon(
          Icons.done,
          size: 100,
        ),
      ),
    );
  }


  Container containerQuiz() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          border: Border.all(
            color: Colors.black,
            width: 6,
          )),
      child: Text(
        'Quiz Container',
        style: TextStyle(fontSize: 30, fontFamily: "casual"),
      ),
    );
  }
}
