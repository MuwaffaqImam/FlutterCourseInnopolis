import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class LanguageTranslatorView extends StatefulWidget {
  const LanguageTranslatorView({Key? key}) : super(key: key);

  @override
  State<LanguageTranslatorView> createState() => _LanguageTranslatorViewState();
}

class _LanguageTranslatorViewState extends State<LanguageTranslatorView> {
  String? _translatedText;

  Future<void> _translateText() async {
    setState(() {
      // _translatedText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('On-device Translation'),
          ),
          body: const Text("Add On-device Translation")),
    );
  }
}
