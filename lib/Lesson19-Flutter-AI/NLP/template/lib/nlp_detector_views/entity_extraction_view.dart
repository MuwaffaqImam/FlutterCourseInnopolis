import 'package:flutter/material.dart';
import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';

class EntityExtractionView extends StatefulWidget {
  const EntityExtractionView({Key? key}) : super(key: key);

  @override
  State<EntityExtractionView> createState() => _EntityExtractionViewState();
}

class _EntityExtractionViewState extends State<EntityExtractionView> {
  var _entities = <EntityAnnotation>[];

  Future<void> _extractEntities() async {
    setState(() {
      // _entities = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entity Extractor'),
        ),
        body: const Text("Add Entity Extractor"),
      ),
    );
  }
}
