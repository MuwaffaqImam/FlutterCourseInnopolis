import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

class PeopleCounterPage extends StatefulWidget {
  const PeopleCounterPage({Key? key}) : super(key: key);

  @override
  PeopleCounterPageState createState() => PeopleCounterPageState();
}

class PeopleCounterPageState extends State<PeopleCounterPage> {
  bool isLoading = false;
  final picker = ImagePicker();

  late ui.Image _image;
  File? _imageFile;
  XFile? imageFile;

  List<Face> _faces = [];
  String _recognizedText = "";
  List<ImageLabel> _labels = [];

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );

  final ImageLabeler _imageLabeler =
      ImageLabeler(options: ImageLabelerOptions());

  final TextRecognizer _textRecognizer = TextRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Computer Vision'),
        ),
        // flaoting action button
        floatingActionButton: FloatingActionButton(
          onPressed: _getImageFromGallery,
          tooltip: 'Get Image',
          child: const Icon(Icons.add_a_photo),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : (_imageFile == null)
                ? const Center(child: Text('no image selected'))
                : Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child:  FittedBox(
                          child: SizedBox(
                              width: _image.width.toDouble(),
                              height: _image.height.toDouble(),
                              child: Image.file(_imageFile!)),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Number of People in this photo: ${_faces.length}",
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Top Image label is ${_labels.first.label}",
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Text recognized: $_recognizedText",
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ));
  }

  _getImageFromGallery() async {
    imageFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      isLoading = true;
    });

    if (mounted) {
      if (imageFile != null) {
        setState(() {
          _imageFile = File(imageFile!.path);
          processImage(InputImage.fromFile(_imageFile!));
          _loadImage(File(imageFile!.path));
        });
      }
    }
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then((value) => setState(() {
          _image = value;
          isLoading = false;
        }));
  }

  Future<void> processImage(InputImage inputImage) async {
    setState(() {
      isLoading = true;
    });
    final faces = await _faceDetector.processImage(inputImage);
    final recognizedText = await _textRecognizer.processImage(inputImage);
    final labels = await _imageLabeler.processImage(inputImage);
    if (mounted) {
      setState(() {
        _faces = faces;
        _recognizedText = recognizedText.text;
        _labels = labels;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void showAlertDialog(BuildContext context, String data) {
    AlertDialog dialog = AlertDialog(
      title: const Text("Text Found!"),
      content: Text("Recognized text: \n$data"),
      actions: [
        TextButton(
            onPressed: () {
              isLoading = false;
              if (mounted) Navigator.of(context).pop();
            },
            child: const Text("Ok"))
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }
}
