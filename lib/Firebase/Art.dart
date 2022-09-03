import 'package:cloud_firestore/cloud_firestore.dart';

class Art {
  late String docId;
  late String title;
  late String image;
  late int views;

  Art.fromDoc(QueryDocumentSnapshot doc) {
    title = doc["title"];
    image = doc["image"];
    views = doc["views"];
    docId = doc.id;
  }
}
