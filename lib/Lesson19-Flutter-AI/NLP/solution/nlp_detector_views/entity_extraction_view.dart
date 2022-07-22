import 'package:flutter/material.dart';
import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';

class EntityExtractionView extends StatefulWidget {
  const EntityExtractionView({Key? key}) : super(key: key);

  @override
  State<EntityExtractionView> createState() => _EntityExtractionViewState();
}

class _EntityExtractionViewState extends State<EntityExtractionView> {
  final _controller = TextEditingController();

  final _entityExtractor =
      EntityExtractor(language: EntityExtractorLanguage.english);
  var _entities = <EntityAnnotation>[];

  Future<void> _extractEntities() async {
    FocusScope.of(context).unfocus();
    final result = await _entityExtractor.annotateText(_controller.text);
    setState(() {
      _entities = result;
    });
  }

  @override
  void dispose() {
    _entityExtractor.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entity Extractor'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(child: Text('Enter text (English)')),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2,
                    )),
                    child: TextField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      maxLines: null,
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: _extractEntities,
                      child: const Text('Extract Entities'))
                ]),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text('Result', style: TextStyle(fontSize: 20)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
