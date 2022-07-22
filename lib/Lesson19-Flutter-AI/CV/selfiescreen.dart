import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

class SelfiePage extends StatefulWidget {
  const SelfiePage({Key? key}) : super(key: key);

  @override
  SelfiePageState createState() => SelfiePageState();
}

class SelfiePageState extends State<SelfiePage> {

  bool isLoading = false;
  final picker = ImagePicker();

  late ui.Image _image;
  File? _imageFile;
  XFile? imageFile;

  SegmentationMask? _mask;
  Size? _imageSize;

  final SelfieSegmenter _segmenter = SelfieSegmenter(
    mode: SegmenterMode.single,
    enableRawSizeMask: true,
  );

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
          : Center(
        child: FittedBox(
          child: SizedBox(
              width: _image.width.toDouble(),
              height: _image.height.toDouble(),
              child: CustomPaint(
                painter: SelfiePainter(_image, _mask!),
              )
          ),
        ),
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
          processImage(_imageFile!);
        });
      }
    }
  }

  Future<void> processImage(File file) async {
    setState(() {
      isLoading = true;
    });
    final inputImage = InputImage.fromFile(file);
    final mask = await _segmenter.processImage(inputImage);
    if (mask != null) {
      if (mounted) {
        final data = await file.readAsBytes();
        await decodeImageFromList(data).then((value) =>
            setState(() {
              _image = value;
              _imageSize = Size(_image.width.toDouble(), _image.height.toDouble());
              _mask = mask;
              isLoading = false;
            }));
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
    _segmenter.close();
    super.dispose();
  }
}

// paint the face
class SelfiePainter extends CustomPainter {
  final ui.Image image;
  final SegmentationMask mask;
  final Color color = Colors.red;

  SelfiePainter(this.image, this.mask);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {

    final width = mask.width;
    final height = mask.height;
    final confidences = mask.confidences;

    final paint = Paint()..style = PaintingStyle.fill;

    canvas.drawImage(image, Offset.zero, Paint());

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int tx = (x * size.width / image.width).round();
        final int ty = (y * size.height / image.width).round();

        final double opacity = confidences[(y * width) + x] * 0.25;
        paint.color = color.withOpacity(opacity);
        canvas.drawCircle(Offset(tx.toDouble(), ty.toDouble()), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SelfiePainter old) {
    return image != old.image  ||  mask != old.mask;
  }
}



