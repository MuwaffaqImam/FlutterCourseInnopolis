import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

class ImageLabelPage extends StatefulWidget {
  const ImageLabelPage({Key? key}) : super(key: key);

  @override
  ImageLabelPageState createState() => ImageLabelPageState();
}

class ImageLabelPageState extends State<ImageLabelPage> {
  bool isLoading = false;
  final picker = ImagePicker();
  late ui.Image _image;
  File? _imageFile;
  XFile? imageFile;

  List<ImageLabel> _labels = [];
  final ImageLabeler _imageLabeler =
      ImageLabeler(options: ImageLabelerOptions());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Lableing'),
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

  Column BuildAIView() {
    return Column(
      children: [
        FittedBox(
          child: SizedBox(
              width: _image.width.toDouble(),
              height: _image.height.toDouble(),
              child: Image.file(_imageFile!)),
        ),
        Divider(thickness: 5),
        Text(
          'Labels Extracted',
          style: TextStyle(fontSize: 18),
        ),
        if (_labels.isNotEmpty)
          Expanded(
            child: ListView.separated(
              itemCount: _labels.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_labels[index].label),
                  subtitle: Text(
                      'Confidence ${_labels[index].confidence.toStringAsFixed(2)}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
            ),
          ),
      ],
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

  ///---------- Focus Here ---------------///
  Future<void> processImage(InputImage inputImage) async {
    setState(() {
      isLoading = true;
    });
    final labels = await _imageLabeler.processImage(inputImage);
    if (labels.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Nothing is detected, try again!')));
      return;
    }
    setState(() {
      _labels = labels;
      isLoading = false;
    });
  }
  ///---------- Focus Here ---------------///


  @override
  void dispose() {
    _imageLabeler.close();
    super.dispose();
  }
}
