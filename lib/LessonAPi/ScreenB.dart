import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  static String routeName = "ScreenB";
  String? title;

  static PageRouteBuilder getRoute() {
    return PageRouteBuilder(
        opaque: false,
        transitionsBuilder: (_, animation, secondAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        },
        pageBuilder: (_, __, ___) {
          return new ScreenB();
        });
  }
  static PageRouteBuilder getRouteWithTitle(String title) {
    return PageRouteBuilder(
        opaque: false,
        transitionsBuilder: (_, animation, secondAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        },
        pageBuilder: (_, __, ___) {
          return new ScreenB(
            title: title,
          );
        });
  }

  ScreenB({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Screen confirmed that it returned");
                },
                child: Text("Go Back")),
            Column(
              children: [
                Text(
                  title == null ? 'Screen B' : title!,
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ],
        )));
  }
}
