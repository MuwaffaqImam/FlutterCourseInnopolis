import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class LanguageTranslatorView extends StatefulWidget {
  const LanguageTranslatorView({Key? key}) : super(key: key);

  @override
  State<LanguageTranslatorView> createState() => _LanguageTranslatorViewState();
}

class _LanguageTranslatorViewState extends State<LanguageTranslatorView> {
  String? _translatedText;
  final _controller = TextEditingController();
  final _controllerTo = TextEditingController();
  final _sourceLanguage = TranslateLanguage.english;
  final _targetLanguage = TranslateLanguage.arabic;
  bool isLoading = false;

  late final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: _sourceLanguage, targetLanguage: _targetLanguage);

  Future<void> _translateText() async {
    setState(() {
      isLoading = true;
    });

    final result = await _onDeviceTranslator.translateText(_controller.text);
    setState(() {
      _translatedText = result;
      _controllerTo.text = result;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _onDeviceTranslator.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('On-device Translation'),
        ),
        body: isLoading ? buildLoading() : buildTraslateUI(),
      ),
    );
  }

  Center buildLoading() {
    return Center(
      child: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.download,
            size: 150,
          ),
          Text("Downloading ${_targetLanguage.name} Modle, please wait "),
          SizedBox(
            height: 16,
          ),
          CircularProgressIndicator()
        ],
      )),
    );
  }

  Padding buildTraslateUI() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
              child: Text(
            'Translated To (${_targetLanguage.name})',
            style: TextStyle(fontSize: 24),
          )),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              icon: Icon(Icons.abc),
              border: OutlineInputBorder(),
              helperText: "Translate from English",
              labelText: "Enter Text",
            ),
            maxLines: null,
          ),
          const SizedBox(height: 30),
          TextField(
            controller: _controllerTo,
            decoration: InputDecoration(
              enabled: false,
              icon: Icon(
                Icons.translate,
                color: Colors.red,
              ),
              border: OutlineInputBorder(),
            ),
            maxLines: null,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: ElevatedButton(
              onPressed: _translateText,
              child: const Text('Translate'),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), primary: Colors.indigo),
            ),
          ),
        ],
      ),
    );
  }
}
