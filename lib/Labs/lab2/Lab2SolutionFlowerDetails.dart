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
          /*******************--[focus here 🧐]--*******************/
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            /*******************--[focus here 🧐]--*******************/
            flowerDetails(context),
          ],
        ));
  }
}

Widget flowerDetails(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        imageGroup(),
        titleGroup(),
        iconGroup(),
        textGroup(),
        buttonGroup(),
      ],
    ),
  );
}

/// Image URL
/// https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg

Widget imageGroup() {
  return Image.network(
    'https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg',
    fit: BoxFit.cover,
  );
}

Widget titleGroup() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Sun Flower',
        style: TextStyle(fontSize: 50, fontFamily: "cursive"),
      ),
      Text(
        '12 piece',
        style: TextStyle(fontSize: 12),
      )
    ],
  );
}

Widget iconGroup() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.share,
          size: 50,
          color: Colors.indigo,
        ),
        Icon(
          Icons.favorite,
          size: 50,
          color: Colors.indigo,
        ),
      ],
    ),
  );
}

/// here is the text to copy
///Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
Widget textGroup() {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0, bottom: 40),
    child: Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      style: TextStyle(fontFamily: "casual"),
    ),
  );
  ;
}

Widget buttonGroup() {
  return Center(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 8)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          Text(
            "Add to cart".toUpperCase(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),

    ),
  );
}

/// bonus widget
Widget buttonGroupAnotherMethod() {
  return Center(
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 8)),
      onPressed: () {},
      icon: Icon(
        Icons.add_shopping_cart,
        color: Colors.white,
      ),
      label: Text(
        "Add to cart".toUpperCase(),
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
