
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui' as ui;

class BarcodeScannerView extends StatefulWidget {
  @override
  _BarcodeScannerViewState createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> {

  bool isLoading = false;
  final picker = ImagePicker();

  late ui.Image _image;
  File? _imageFile;
  XFile? imageFile;

  final BarcodeScanner _barcodeScanner = BarcodeScanner();

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
            child: Image.file(_imageFile!)
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
          _loadImage(File(imageFile!.path));
          processImage(InputImage.fromFile(_imageFile!));
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
    final barcodes = await _barcodeScanner.processImage(inputImage);
    if (barcodes.isNotEmpty) {
      if (mounted) {
        showAlertDialog(context, barcodes.first.displayValue.toString());
      }
    }else{
     Future.delayed(Duration(milliseconds: 450),(){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         action: SnackBarAction(
           label: "OK",
           onPressed: () {},
         ),
         content: Text('Nothing is detected, try again!'),
         duration: Duration(milliseconds: 500),
       ));
     });
    }
    if (mounted) {
      setState(() {});
    }
  }

  void showAlertDialog(BuildContext context, String data) {
    AlertDialog dialog = AlertDialog(
      title: const Text("Barcode found !"),
      content: Text("Data encoded in barcode: \n$data"),
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
    _barcodeScanner.close();
    super.dispose();
  }

}

