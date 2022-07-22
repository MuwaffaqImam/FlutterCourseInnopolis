import 'package:courses_codes/Lesson19-Flutter-AI/cv/barcodescreen.dart';
import 'package:courses_codes/Lesson19-Flutter-AI/cv/textrecognitionscreen.dart';
import 'package:flutter/material.dart';

import 'cv/DigitalInkDetector.dart';
import 'cv/facedetectionscreen.dart';
import 'cv/imageLabellingCoustmModel.dart';
import 'cv/imagelabellingscreen.dart';

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
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(context),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (_) => BarcodeScannerView()));
          },
          title: Text(
            'Barcode Recognizer',
            style: TextStyle(fontFamily: 'Eczar', fontSize: 24),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (_) => TextRecognitionPage()));
          },
          title: Text(
            'Text Recognition',
            style: TextStyle(fontFamily: 'Eczar', fontSize: 24),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (_) => ImageLabelPage()));
          },
          title: Text(
            'Image Labeling',
            style: TextStyle(fontFamily: 'Eczar', fontSize: 24),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (_) => FaceDetectionPage()));
          },
          title: Text(
            'Face Detection',
            style: TextStyle(fontFamily: 'Eczar', fontSize: 24),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),

      ],
    );
  }
}
