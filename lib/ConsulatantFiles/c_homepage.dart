import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:equalista/ConsulatantFiles/ChatBot/ChatScreen.dart';
import 'package:equalista/ConsulatantFiles/c_drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter_translate/flutter_translate.dart';

class C_homepage extends StatefulWidget{
  const C_homepage({super.key});

  @override
  State<C_homepage> createState() => _C_homepageState();
}

class _C_homepageState extends State<C_homepage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  late OpenAI? chatGPT;

  StreamSubscription? _subscription;

  bool _isImageSearch = false;

  bool _isTyping = false;

  get kTranslateModelV3 => null;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: "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",
        baseOption: HttpSetup(receiveTimeout: Duration (seconds: 60000)));
    super.initState();
  }

  @override
  void dispose() {
    chatGPT?.close();
    _subscription?.cancel();
    super.dispose();
  }

  void _sendMessage()async{
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "User",
    );
    setState(() {
      _messages.insert(0, message);
    });
    _controller.clear();
    final request =    CompleteText(prompt: message.text, model: kTranslateModelV3);
    final response = await chatGPT!.onCompletion(request: request);
    Vx.log(response!.choices[0].text);
    insertNewData(response.choices[0].text);
  }

  void insertNewData(String response) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "bot",
    );
    setState(() {
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer(){
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: InputDecoration.collapsed(hintText: "Send message"),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            _sendMessage();
            print(_messages);
          },
        ),
      ],
    ).px8();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot'),
      ),
      drawer: const C_drawer(),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    padding: Vx.m8,
                    itemCount: _messages.length,
                    itemBuilder: (context, index){
                  return _messages[index];
                })),
            Container(
              decoration: BoxDecoration(
                color: context.cardColor
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      )
    );
  }
}
