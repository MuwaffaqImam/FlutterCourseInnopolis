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
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design'),
      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: buildDrawer(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
              child: FlutterLogo(
            style: FlutterLogoStyle.horizontal,
          )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home screen'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Login Screen'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings screen'),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Business',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'School',
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.pink,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      onTap: (indexTapped) {
        setState(() {
          currentIndex = indexTapped;
        });
      },
    );
  }

  Widget buildBody() {
    switch (currentIndex) {
      case 0:return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.home, size: 200,), Text('screen $currentIndex'),],));
      case 1:return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.shopping_cart, size: 200,), Text('screen $currentIndex'),],));
      case 2:return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.notifications, size: 200,), Text('screen $currentIndex'),],));
      default:return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.settings, size: 200,), Text('screen $currentIndex'),],));

    }
  }
}
