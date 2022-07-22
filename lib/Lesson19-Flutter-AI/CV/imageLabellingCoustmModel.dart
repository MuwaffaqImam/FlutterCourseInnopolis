import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageLabelCoustemModelPage extends StatefulWidget {
  const ImageLabelCoustemModelPage({Key? key}) : super(key: key);

  @override
  ImageLabelCoustemModelPageState createState() =>
      ImageLabelCoustemModelPageState();
}

class ImageLabelCoustemModelPageState
    extends State<ImageLabelCoustemModelPage> {
  bool isLoading = false;
  final picker = ImagePicker();

  late ui.Image _image;
  File? _imageFile;
  XFile? imageFile;

  List<ImageLabel> _labels = [];

  late ImageLabeler _imageLabeler;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getModle() async {
    final modelPath = await _getModel('assets/ml/imageClassification.tflite');
    final options = LocalLabelerOptions(modelPath: modelPath);
    _imageLabeler = ImageLabeler(options: options);
  }

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
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(),
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

    await getModle();

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
    final labels = await _imageLabeler.processImage(inputImage);
    if (labels.isNotEmpty) {
      if (mounted) {
        setState(() {
          _labels = labels;
        });
      }
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
    _imageLabeler.close();
    super.dispose();
  }

  Future<String> _getModel(String assetPath) async {
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}
