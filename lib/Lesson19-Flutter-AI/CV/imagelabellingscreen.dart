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

  final ImageLabeler _imageLabeler = ImageLabeler(options: ImageLabelerOptions());

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
                        child: Image.file(_imageFile!)
                    ),
              ),
              Divider(thickness: 5),
              Text('Labels Extracted',style:TextStyle(fontSize:18),),
              if (_labels.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    itemCount: _labels.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(_labels[index].label),
                        subtitle: Text('Confidence ${_labels[index].confidence.toStringAsFixed(2)}'),
                      );
                    }, separatorBuilder: (BuildContext context, int index) =>Divider(),
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
      if(imageFile != null){
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
    await decodeImageFromList(data).then((value) =>
        setState(() {
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
}

// paint the face
class LabelPainter extends CustomPainter {
  final ui.Image image;
  final List<ImageLabel> labels;

  LabelPainter(this.image, this.labels);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
          textAlign: TextAlign.left,
          fontSize: 72,
          textDirection: TextDirection.ltr),
    );

    builder.pushStyle(ui.TextStyle(color: Colors.black, fontWeight: FontWeight.bold));

    canvas.drawImage(image, Offset.zero, Paint());
    for (var i = 0; i < labels.length; i++) {
      builder.addText('Label: ${labels[i].label}, '
          'Confidence: ${labels[i].confidence.toStringAsFixed(2)}\n');
    }
    builder.pop();
    canvas.drawParagraph(
      builder.build()
        ..layout(ui.ParagraphConstraints(
          width: size.width,
        )),
      const Offset(0, 0),
    );
  }

  @override
  bool shouldRepaint(LabelPainter old) {
    return image != old.image  || labels != old.labels;
  }
}



