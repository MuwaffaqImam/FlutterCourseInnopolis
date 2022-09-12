import 'package:courses_codes/6-FlutterAndAI/CV/BarcodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:courses_codes/6-FlutterAndAI/CV/peoplecounter.dart';
import 'package:courses_codes/6-FlutterAndAI/cv/textrecognitionscreen.dart';
import 'package:courses_codes/6-FlutterAndAI/CV/FaceDetectionScreen.dart';
import 'package:courses_codes/6-FlutterAndAI/CV/ImageLabellingScreen.dart';
import 'package:courses_codes/6-FlutterAndAI/NLP/WikipediaTraslator.dart';
import 'package:courses_codes/6-FlutterAndAI/NLP/language_identifier_view.dart';
import 'package:courses_codes/6-FlutterAndAI/NLP/language_translator_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(fontFamily: "Eczar", primarySwatch: Colors.red),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('AI with Flutter'),
        elevation: 4,
      ),
      body: Center(
          child: Text(
        "Welcome to the Course!!",
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
