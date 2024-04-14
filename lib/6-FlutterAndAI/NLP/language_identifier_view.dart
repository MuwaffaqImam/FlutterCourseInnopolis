import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class LanguageIdentifierView extends StatefulWidget {
  const LanguageIdentifierView({Key? key}) : super(key: key);

  @override
  State<LanguageIdentifierView> createState() => _LanguageIdentifierViewState();
}

class _LanguageIdentifierViewState extends State<LanguageIdentifierView> {
  List<IdentifiedLanguage> _identifiedLanguages = <IdentifiedLanguage>[];
  final TextEditingController _controller = TextEditingController();
  final _languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
  var _identifiedLanguage = '';

  Future<void> _identifyLanguage() async {
    if (_controller.text == '') return;
    String language;
    try {
      language = await _languageIdentifier.identifyLanguage(_controller.text);
    } catch (e) {
      print(e);
      language = 'error: no language identified!';
    }
    setState(() {
      _identifiedLanguage = language;
    });
  }

  Future<void> _identifyPossibleLanguages() async {
    if (_controller.text == '') return;
    String error;
    try {
      final possibleLanguages =
          await _languageIdentifier.identifyPossibleLanguages(_controller.text);
      setState(() {
        _identifiedLanguages = possibleLanguages;
      });
      return;
    } catch (e) {
      print(e);
      error = 'error: ${e.toString()}';
    }
    setState(() {
      _identifiedLanguages = [];
      _identifiedLanguage = error;
    });
  }

  @override
  void dispose() {
    _languageIdentifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language Identification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              icon: Icon(Icons.edit),
              border: OutlineInputBorder(),
              labelText: "Enter Text to identify",
            ),
            maxLines: null,
          ),
          const SizedBox(height: 15),
          _identifiedLanguage == ''
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Identified Language: $_identifiedLanguage',
                    style: const TextStyle(fontSize: 20),
                  )),
          ElevatedButton(
            onPressed: _identifyLanguage,
            child: const Text('Identify Language'),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50)),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: _identifyPossibleLanguages,
            child: const Text('Identify possible languages'),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Colors.indigo,
              padding: EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: _identifiedLanguages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      'Language: ${_identifiedLanguages[index].languageTag}  Confidence: ${_identifiedLanguages[index].confidence.toString()}'),
                );
              })
        ]),
      ),
    );
  }
}
