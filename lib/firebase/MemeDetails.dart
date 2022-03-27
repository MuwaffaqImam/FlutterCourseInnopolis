import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Art.dart';

class MemeDetailsScreen extends StatelessWidget {
  final Meme meme;

  MemeDetailsScreen(this.meme, {Key? key}) : super(key: key);

  static PageRouteBuilder getRoute(Meme meme) {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return MemeDetailsScreen(meme);
    });
  }

  @override
  Widget build(BuildContext context) {
    updateViews();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('${meme.title}'),
      ),
      body: Center(child: Image.network(meme.image)),
    );
  }

  void updateViews() {
    FirebaseFirestore.instance
        .collection('gallery')
        .doc(meme.docId)
        .update({"views": FieldValue.increment(1)});
  }
}
