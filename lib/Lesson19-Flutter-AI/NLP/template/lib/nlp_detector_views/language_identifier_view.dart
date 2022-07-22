import 'package:flutter/material.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class LanguageIdentifierView extends StatefulWidget {
  const LanguageIdentifierView({Key? key}) : super(key: key);

  @override
  State<LanguageIdentifierView> createState() => _LanguageIdentifierViewState();
}

class _LanguageIdentifierViewState extends State<LanguageIdentifierView> {
  List<IdentifiedLanguage> _identifiedLanguages = <IdentifiedLanguage>[];
  var _identifiedLanguage = '';

  Future _identifyLanguage() async {}

  Future<void> _identifyPossibleLanguages() async {
    setState(() {
      // _identifiedLanguages = ;
      // _identifiedLanguage = ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Language Identification')),
        body: const Text("Add Language Identification"));
  }
}
