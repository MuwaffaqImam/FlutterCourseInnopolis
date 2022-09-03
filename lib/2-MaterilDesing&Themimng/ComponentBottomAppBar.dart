import 'package:courses_codes/Labs/lab5-Theming/style.dart';
import 'package:flutter/material.dart';

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
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 200,
              )),
              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
              Divider(),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person),
              ),
              Divider(),
              ListTile(
                title: Text("Favorite"),
                leading: Icon(Icons.favorite),
              ),
              Divider(),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Material Design"),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          shape: CircularNotchedRectangle(),
          child: SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(Icons.favorite),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(Icons.settings),
                  ],
                ),
              )),
        ),
        body: myWidget(context));
  }

  Widget myWidget(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 6,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Center(child: Text("Im a Card")),
              ),
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ActionChip(
              avatar: CircleAvatar(
                child: Text("MI"),
              ),
              label: Text("Muwaffaq Imam"),
              onPressed: () {}),
          SizedBox(
            height: 16,
          ),
          InputChip(
              selected: true,
              avatar: Text("MS"),
              label: Text("Muwaffaq Imam"),
              onPressed: () {}),
          SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.amberAccent,
            title: Text("This is Title"),
            subtitle: Text("This is subtitle"),
            leading: CircleAvatar(
              child: Icon(Icons.folder),
            ),
            trailing: Icon(
              Icons.star,
              color: Colors.red,
            ),
            onTap: () {},
          ),
          SizedBox(
            height: 16,
          ),
          createFABExtended()
        ],
      ),
    );
  }

  Widget createFABExtended() {
    return FloatingActionButton.extended(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("I'm snack bar"),
          action: SnackBarAction(
            label: "ACTION",
            onPressed: () {},
          ),
        ));
      },
      label: Text("add user".toUpperCase()),
      icon: Icon(Icons.add),
    );
  }
}
