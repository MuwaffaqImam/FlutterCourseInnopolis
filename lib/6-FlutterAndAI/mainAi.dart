import 'package:flutter/material.dart';
import './CV/peoplecounter.dart';
import './cv/barcodescreen.dart';
import './cv/textrecognitionscreen.dart';
import './CV/FaceDetectionScreen.dart';
import './CV/ImageLabellingScreen.dart';
import './NLP/WikipediaTraslator.dart';
import './NLP/language_identifier_view.dart';
import './NLP/language_translator_view.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
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

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
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
      body: myWidget(context),
    );
  }

  Widget myWidget(BuildContext context) {
    return ListView(
      children: [
          ListTile(
            leading: Icon(Icons.camera_alt,color: Colors.indigo,),
          title: Text(
            "Computer Vison",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (_) => BarcodeScannerView()));
              },
              title: Text(
                'Barcode Recognizer',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              trailing: Image.network(
                  "https://developers.google.com/static/ml-kit/vision/barcode-scanning/images/barcode_scanning2x.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (_) => TextRecognitionPage()));
              },
              title: Text(
                'Text Recognition',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              trailing: Image.network(
                  "https://developers.google.com/static/ml-kit/vision/text-recognition/images/text_recognition2x.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (_) => ImageLabelPage()));
              },
              title: Text(
                'Image Labeling',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              trailing: Image.network(
                  "https://developers.google.com/static/ml-kit/vision/image-labeling/images/image_labeling2x.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (_) => FaceDetectionPage()));
              },
              title: Text(
                'Face Detection',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              trailing: Image.network(
                  "https://developers.google.com/static/ml-kit/vision/face-detection/images/face_detection2x.png"),
            ),
          ),
        ),
        Divider(),

        ListTile(
            leading: Icon(Icons.translate,color: Colors.indigo,),
          title: Text(
            "NLP",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (_) => LanguageIdentifierView()));
              },
              title: Text(
                'Language Identifier',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              trailing: Image.network(
          
                  "https://developers.google.com/static/ml-kit/images/language_detection2x.png",),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (_) => LanguageTranslatorView()));
              },
              title: Text(
                'Language Translator',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              trailing: Image.network(
                  "https://developers.google.com/static/ml-kit/images/on_device_translate2x.png"),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
        ListTile(
          title: Text(
            "Tasks to Do",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(8),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (_) => PeopleCounterPage()));
              },
              title: Text(
                'People Counter',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              subtitle: Text("CV Task"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(8),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (_) => WikipediaTraslator()));
              },
              title: Text(
                'Wikipedia Traslator',
                style: TextStyle(fontFamily: 'Eczar', fontSize: 20),
              ),
              subtitle: Text("NLP Task"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ],
    );
  }
}
