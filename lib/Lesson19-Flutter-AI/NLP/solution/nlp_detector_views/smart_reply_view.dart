import 'package:flutter/material.dart';
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart';

class SmartReplyView extends StatefulWidget {
  const SmartReplyView({Key? key}) : super(key: key);

  @override
  State<SmartReplyView> createState() => _SmartReplyViewState();
}

class _SmartReplyViewState extends State<SmartReplyView> {
  final _localUserController = TextEditingController();
  final _remoteUserController = TextEditingController();
  SmartReplySuggestionResult? _suggestions;

  final SmartReply _smartReply = SmartReply();

  void _addMessage(TextEditingController controller, bool localUser) {
    FocusScope.of(context).unfocus();
    if (controller.text.isNotEmpty) {
      if (localUser) {
        _smartReply.addMessageToConversationFromLocalUser(
            controller.text, DateTime.now().millisecondsSinceEpoch);
      } else {
        _smartReply.addMessageToConversationFromRemoteUser(
            controller.text, DateTime.now().millisecondsSinceEpoch, 'userZ');
      }
      controller.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message added to the conversation')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message can\'t be empty')));
    }
  }

  Future<void> _suggestReplies() async {
    FocusScope.of(context).unfocus();
    final result = await _smartReply.suggestReplies();
    setState(() {
      _suggestions = result;
    });
  }

  @override
  void dispose() {
    _smartReply.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Reply'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 30),
                const Text('Local User:'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2,
                    )),
                    child: TextField(
                      controller: _localUserController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      maxLines: null,
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () => _addMessage(_localUserController, true),
                      child: const Text('Add message to conversation')),
                ),
                const SizedBox(height: 30),
                const Text('Remote User:'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2,
                    )),
                    child: TextField(
                      controller: _remoteUserController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      maxLines: null,
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () =>
                          _addMessage(_remoteUserController, false),
                      child: const Text('Add message to conversation')),
                ),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_smartReply.conversation.isNotEmpty)
                        ElevatedButton(
                            onPressed: () {
                              _smartReply.clearConversation();
                              setState(() {
                                _suggestions = null;
                              });
                            },
                            child: const Text('Clear conversation')),
                      ElevatedButton(
                          onPressed: _suggestReplies,
                          child: const Text('Get Suggest Replies')),
                    ]),
                const SizedBox(height: 30),
                if (_suggestions != null)
                  Text('Status: ${_suggestions!.status.name}'),
                if (_suggestions != null &&
                    _suggestions!.suggestions.isNotEmpty)
                  for (final suggestion in _suggestions!.suggestions)
                    Text('\t $suggestion'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
