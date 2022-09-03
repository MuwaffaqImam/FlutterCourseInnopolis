import 'package:courses_codes/3-Asynchronous%20Networking%20Programming/3-RoutingScreens.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Eczar"),
      routes: {
        "ScreenB": (context) => ScreenB(),
      },
      home: ScreenA(),
    );
  }
}

class ScreenA extends StatelessWidget {
  ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text('App Title'),
          backgroundColor: Colors.black,
          elevation: 4,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Screen A",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.indigo),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Go to B"))
            ],
          ),
        ));
  }

  void MethodPageRoute(BuildContext context) {}

  void MethodMaterilRoute(BuildContext context) {}

  void MethodPushedName(BuildContext context) {}

  void MethodAnimation(BuildContext context) {
    PageRouteBuilder(
        transitionsBuilder: (_, animation, secondAnimation, child) {
      /// add your animation here
      return FadeTransition(
        opacity: animation,
        child: RotationTransition(
          turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: child,
        ),
      );
    }, pageBuilder: (_, __, ___) {
      return new ScreenB();
    });
  }

  void MethodWaitForData(BuildContext context) async {}
}

class ScreenB extends StatelessWidget {
  var data;
  ScreenB({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
        backgroundColor: Color(0xFF303030),
        appBar: AppBar(
          title: const Text('App Title'),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Screen B",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.amberAccent),
              ),
              if (arguments != null)
                Text(
                  "$arguments",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.blueAccent),
                ),
              if (data != null)
                Text(
                  "$data",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.blueAccent),
                ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, "Data From Other");
                  },
                  child: Text("Go back"))
            ],
          ),
        ));
  }
}
