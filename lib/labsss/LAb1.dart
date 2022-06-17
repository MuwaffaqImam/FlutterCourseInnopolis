import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // to change your app color change this
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text(
            'Flower Shop',
            style: TextStyle(fontFamily: 'casual'),
          ),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Container(
                width: 300,
                height: 400,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 30),
                  ),
                )),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 30),
                    ),
                  )),
            ),
          ],
        )

    );
  }
}

Widget flowerDetails(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        /** Focus Here **/
        Container(
            width: 300,
            height: 400,
            color: Colors.blue,
            child: Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 30),
              ),
            )),
        Container(
            width: 300,
            color: Colors.red,
            child: Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 30),
              ),
            )),
        Container(
            width: 700,
            height: 700,
            color: Colors.grey,
            child: Center(
              child: Text(
                '3',
                style: TextStyle(fontSize: 30),
              ),
            )),
        Container(
            width: 300,
            color: Colors.green,
            child: Center(
              child: Text(
                '4',
                style: TextStyle(fontSize: 30),
              ),
            )),
        /** Focus Here **/
      ],
    ),
  );
}

/// Image URL
/// https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg

Widget imageGroup() {
  return Image.network(
      "https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg");
}

Widget titleGroup() {
  return ElevatedButton(
    onPressed: () {},
    child: Text("press me"),
    style: ElevatedButton.styleFrom(
      onPrimary: Colors.grey,
    ),
  );
}

Widget iconGroup() {
  return Text('Replace with icons group');
  ;
}

/// here is the text to copy
///Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
Widget textGroup() {
  return Text('Replace with text group');
  ;
}

Widget buttonGroup() {
  return Text('Replace with button group');
  ;
}
