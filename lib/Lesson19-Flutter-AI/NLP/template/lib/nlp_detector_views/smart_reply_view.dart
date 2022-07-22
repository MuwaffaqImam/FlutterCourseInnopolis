import 'package:flutter/material.dart';
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart';

class SmartReplyView extends StatefulWidget {
  const SmartReplyView({Key? key}) : super(key: key);

  @override
  State<SmartReplyView> createState() => _SmartReplyViewState();
}

class _SmartReplyViewState extends State<SmartReplyView> {
  SmartReplySuggestionResult? _suggestions;

  void _addMessage(TextEditingController controller, bool localUser) {}

  Future<void> _suggestReplies() async {
    setState(() {
      // _suggestions = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Smart Reply'),
          ),
          body: const Text("Add Smart Reply")),
    );
  }
}
