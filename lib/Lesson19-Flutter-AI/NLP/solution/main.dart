import 'package:flutter/material.dart';
import '../template/lib/lab_task.dart';
import '../template/lib/nlp_detector_views/language_translator_view.dart';
import 'nlp_detector_views/entity_extraction_view.dart';
import 'nlp_detector_views/language_identifier_view.dart';
import 'nlp_detector_views/smart_reply_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter NLP Lab'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: const [
                  FeatureButton('Language ID', LanguageIdentifierView()),
                  FeatureButton(
                      'On-device Translation', LanguageTranslatorView()),
                  FeatureButton('Smart Reply', SmartReplyView()),
                  FeatureButton('Entity Extraction', EntityExtractionView()),
                  FeatureButton('Lab Task', LabTask()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final String _label;
  final Widget _viewPage;

  const FeatureButton(this._label, this._viewPage, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _viewPage));
      },
      child: Text(_label),
    );
  }
}
