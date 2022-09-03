import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Art.dart';

class ArtDetails extends StatelessWidget {
  final Art art;

  ArtDetails(this.art, {Key? key}) : super(key: key);

  static PageRouteBuilder getRoute(Art art) {
    return PageRouteBuilder(
        transitionsBuilder: (_, animation, secondAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: RotationTransition(
          turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: child,
        ),
      );
    }, pageBuilder: (_, __, ___) {
      return new ArtDetails(art);
    });
  }

  @override
  Widget build(BuildContext context) {
    updateViews();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(art.title),
      ),
      body: Center(child: Image.network(art.image)),
    );
  }

  void updateViews() {
    FirebaseFirestore.instance
        .collection('gallery')
        .doc(art.docId)
        .update({'views': FieldValue.increment(1)})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
