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
  late RecognizedText? textRecognized;
  final picker = ImagePicker();

  late ui.Image _image;
  File? _imageFile;
  XFile? imageFile;

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: SizedBox(
                          width: _image.width.toDouble(),
                          height: _image.height.toDouble(),
                          child: Image.file(_imageFile!)),
                    ),
                    Divider(thickness: 5),
                    Text('Text Extracted',style:TextStyle(fontSize:18),),
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
                ),
    );
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
          _loadImage(File(imageFile!.path));
          processImage(InputImage.fromFile(_imageFile!));
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
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (recognizedText.text.isNotEmpty) {
      if (mounted) {
        if (mounted) {
          setState(() {});
          textRecognized = recognizedText;
        }
      }
    } else {
      if (mounted) {
        showAlertDialog(context, 'No text is detected');
      }
    }
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
    _textRecognizer.close();
    super.dispose();
  }
}
