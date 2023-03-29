import 'package:equalista/UserFiles/Models/chat.dart';
import 'package:flutter/material.dart';

import '../ConsulatantFiles/c_homepage.dart';

class U_chat extends StatefulWidget {
  const U_chat({super.key});

  @override
  State<U_chat> createState() => _U_chatState();
}

class _U_chatState extends State<U_chat> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help from consultant'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildList(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  _buildInput(),
                  _buildSubmit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Chat> _messages = [
    Chat(
      message: "Hello sir",
      name: "you",
    ),
    Chat(
      message: "Hello, I am your consultant. How can I help you?",
      name: "consultant",
    ),
    Chat(
      message:
          "Sir I am facing some problems in this organization based on my gender",
      name: "you",
    ),
  ];

  ListView _buildList() {
    return ListView(
      children: const [
        ChatMessageWidget(text: "Hello sir", chatMessageType: "you"),
        ChatMessageWidget(
            text: "Hello, I am your consultant. How can I help you?",
            chatMessageType: "consultant"),
        ChatMessageWidget(
            text:
                "Sir I am facing some problems in this organization based on my gender",
            chatMessageType: "you")
      ],
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textAlign: TextAlign.justify,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.black),
        controller: _textController,
        decoration: const InputDecoration(
          fillColor: botBackgroundColor,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: botBackgroundColor,
        child: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            color: Color.fromRGBO(142, 142, 160, 1),
          ),
          onPressed: () async {
            setState(
              () {
                isLoading = true;
              },
            );
            var input = _textController.text;
            _textController.clear();
            Future.delayed(const Duration(milliseconds: 50));

            generateResponse(input).then((value) {
              setState(() {
                isLoading = false;
              });
            });
            _textController.clear();
          },
        ),
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    super.key,
    required this.text,
    required this.chatMessageType,
  });

  final String text;
  final String chatMessageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      color: chatMessageType == "consultant"
          ? botBackgroundColor
          : backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          chatMessageType == "consultant"
              ? Container(
                  margin: const EdgeInsets.only(right: 10.0, top: 10),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                    child: Text(
                      'CN',
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const CircleAvatar(child: Text("You")),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
