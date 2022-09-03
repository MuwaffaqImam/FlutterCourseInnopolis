import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

class TextRecognitionPage extends StatefulWidget {
  const TextRecognitionPage({Key? key}) : super(key: key);

  @override
  TextRecognitionState createState() => TextRecognitionState();
}

class TextRecognitionState extends State<TextRecognitionPage> {
  bool isLoading = false;
  RecognizedText? textRecognized;
  final picker = ImagePicker();

  late ui.Image _image;
  File? _imageFile;
  XFile? imageFile;

  final TextRecognizer _textRecognizer = TextRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Recognition'),
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: _getImageFromGallery,
          tooltip: 'Get Image',
          child: const Icon(Icons.add_a_photo),
        ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : (_imageFile == null)
              ? buildEmptyView()
              : BuildAIView(),
    );
  }

  Widget BuildAIView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: SizedBox(
              width: _image.width.toDouble(),
              height: _image.height.toDouble(),
              child: Image.file(_imageFile!)),
        ),
        Divider(thickness: 5),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Extracted Text:',
            style: TextStyle(fontSize: 24),
          ),
        ),
        if (textRecognized != null)
          Expanded(
            child: ListView.builder(
              itemCount: textRecognized!.blocks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(textRecognized!.blocks[index].text),
                );
              },
            ),
          ),
      ],
    );
  }

  /// Build UI
  Widget buildEmptyView() {
    return InkWell(
      onTap: _getImageFromGallery,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 150,
            child: Icon(
              Icons.add_a_photo,
              size: 150,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text("Click here to add an Image")
        ],
      )),
    );
  }

  ///---------- Focus Here ---------------///
  Future<void> processImage(InputImage inputImage) async {
    setState(() {
      isLoading = true;
    });
    RecognizedText recognizedText =
        await _textRecognizer.processImage(inputImage);
    if (recognizedText.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Nothing is detected, try again!')));
      return;
    }
    setState(() {
      textRecognized = recognizedText;
    });
  }

  ///---------- Focus Here ---------------///

  /// Pick Image From Galleary
  _getImageFromGallery() async {
    imageFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      isLoading = true;
    });
    if (mounted) {
      if (imageFile != null) {
        setState(() {
          _imageFile = File(imageFile!.path);
          _loadImage(File(imageFile!.path));
          ///---------- Focus Here ---------------///
          processImage(InputImage.fromFile(_imageFile!));
          ///---------- Focus Here ---------------///
        });
      }
    }
  }

  /// Read Image From Bytes
  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then((value) => setState(() {
          _image = value;
          isLoading = false;
        }));
  }

  @override
  void dispose() {
    _textRecognizer.close();
    super.dispose();
  }
}
