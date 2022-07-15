import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartListWidgets.dart';
import 'CartModel.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO ADD provider here
    return MaterialApp(
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
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: const Text('My Store'),
        actions: [
          _CartTotal(),
          SizedBox(
            width: 16,
          ),
          Icon(Icons.shopping_cart_rounded),
          SizedBox(
            width: 16,
          )
        ],
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: MyCart(),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.deepPurple,
      //   onPressed: () {},
      //   label: Text('Deleted Items'),
      //   icon: Icon(Icons.delete),
      // ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.headline6!.copyWith(
          fontSize: 30,
          fontFamily: 'Eczar',
          color: Colors.yellow,
        );

    return SizedBox(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.

            // TODO listen to changes here
            Text('\$ 0.0', style: hugeStyle),
          ],
        ),
      ),
    );
  }
}
