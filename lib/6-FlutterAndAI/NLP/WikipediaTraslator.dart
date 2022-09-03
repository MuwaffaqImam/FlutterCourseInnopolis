import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:http/http.dart' as http;
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class WikipediaTraslator extends StatefulWidget {
  const WikipediaTraslator({Key? key}) : super(key: key);

  @override
  State<WikipediaTraslator> createState() => _WikipediaTraslatorState();
}

class _WikipediaTraslatorState extends State<WikipediaTraslator> {
  final TextEditingController _pageTitleController =
      TextEditingController(text: "paris");
  final TextEditingController _subdomainController =
      TextEditingController(text: "en");

  final _languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
  var _identifiedLanguage = '';

  // Change languages
  TranslateLanguage sourceLanguage = TranslateLanguage.english;
  TranslateLanguage targetLanguage = TranslateLanguage.arabic;
  late final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: sourceLanguage, targetLanguage: targetLanguage);
  String _translatedText = "";
  String wikiArticleContent = "";

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
                    filled: true,
                    icon: Icon(Icons.language),
                    helperText: "try to add: en, ar, ru",
                    label: Text("language")),
                controller: _subdomainController,
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    filled: true,
                    helperText: "Try to add words like: London, Egypt, Kazan",
                    label: Text("Wiki Page title")),
                controller: _pageTitleController,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () => fetchWiki(),
                  child: const Text('Fetch Wiki')),
              const SizedBox(height: 15),
              Text(
                "Identified Language: $_identifiedLanguage",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              Text(
                wikiArticleContent.substring(
                    0, min(wikiArticleContent.length, 600)),
              ),
              const SizedBox(height: 15),
              const Text(
                "Translation",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              Text(
                _translatedText.substring(0, min(_translatedText.length, 600)),
              )
            ],
          ),
        ),
      ),
    );
  }

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
    _translateText(
        wikiArticleContent.substring(0, min(wikiArticleContent.length, 500)));
  }

  @override
  void dispose() {
    _languageIdentifier.close();
    super.dispose();
  }
}
