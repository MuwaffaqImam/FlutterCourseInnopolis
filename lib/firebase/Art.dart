import 'package:cloud_firestore/cloud_firestore.dart';

class Meme {
  late String title;
  late String image;
  late int views;
  late String docId;

  Meme.fromDoc(QueryDocumentSnapshot doc) {
    title = doc["title"];
    image = doc["image"];
    views = doc["views"];
    docId = doc.id;
  }
}
