import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import 'package:http/http.dart' as http;

import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class LabTask extends StatefulWidget {
  const LabTask({Key? key}) : super(key: key);

  @override
  State<LabTask> createState() => _LabTaskState();
}

class _LabTaskState extends State<LabTask> {
  final TextEditingController _pageTitleController =
      TextEditingController(text: "paris");

  final TextEditingController _subdomainController =
      TextEditingController(text: "en");

  final _languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
  var _identifiedLanguage = '';

  final _entityExtractor = EntityExtractor(
      language:
          EntityExtractorLanguage.english); // Change this to match subdomain
  var _entities = <EntityAnnotation>[];

  // Change languages
  TranslateLanguage sourceLanguage = TranslateLanguage.english;
  TranslateLanguage targetLanguage = TranslateLanguage.russian;
  late final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: sourceLanguage, targetLanguage: targetLanguage);
  String _translatedText = "";

  Future _extractEntities(String text) async {
    final result = await _entityExtractor.annotateText(text);
    setState(() {
      _entities = result;
    });
  }

  String wikiArticleContent = "";

  Future _identifyLanguage(String text) async {
    String language;
    try {
      language = await _languageIdentifier.identifyLanguage(text);

      sourceLanguage =
          BCP47Code.fromRawValue(language) ?? TranslateLanguage.english;
    } catch (e) {
      language = 'error: ${e.toString()}';
    }
    setState(() {
      _identifiedLanguage = language;
    });
  }

  Future<void> _translateText(String text) async {
    setState(() {
      _translatedText = "Translating ...";
    });
    final result = await _onDeviceTranslator.translateText(text);
    setState(() {
      _translatedText = result;
    });
  }

  void fetchWiki() async {
    http.Response x = await http.get(Uri.parse(
        'https://${_subdomainController.text}.wikipedia.org/w/api.php?action=query&prop=extracts&exsentences=10&exlimit=1&titles=${_pageTitleController.text}&explaintext=1&formatversion=2&format=json'));
    var json = jsonDecode(x.body);
    var pages = json["query"]["pages"];
    String pageContent = pages[0]["extract"];

    setState(() {
      wikiArticleContent = pageContent;
    });

    _identifyLanguage(wikiArticleContent);
    _extractEntities(wikiArticleContent);
    _translateText(
        wikiArticleContent.substring(0, min(wikiArticleContent.length, 500)));
  }

  @override
  void dispose() {
    _languageIdentifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab Task')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                    label: Text("Subdomain for language (x.wikipedia.org)")),
                controller: _subdomainController,
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                    label: Text(
                        "Page/city title (should match url in Wiki article)")),
                controller: _pageTitleController,
              ),
              ElevatedButton(
                  onPressed: () => fetchWiki(),
                  child: const Text('Fetch Wiki')),
              const SizedBox(height: 15),
              Text(
                "Identified Language: $_identifiedLanguage",
                style: const TextStyle(fontSize: 18),
              ),
              const Text(
                "Entities",
                style: TextStyle(fontSize: 18),
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _entities.length,
                itemBuilder: (context, index) => ExpansionTile(
                    title: Text(_entities[index].text),
                    children: _entities[index]
                        .entities
                        .map((e) => Text('${e.type.name}: $e'))
                        .toList()),
              ),
              const SizedBox(height: 15),
              Text(
                wikiArticleContent.substring(
                    0, min(wikiArticleContent.length, 400)),
              ),
              const Text(
                "Translation",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                _translatedText.substring(0, min(_translatedText.length, 400)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
