import 'dart:async';
import 'dart:convert';
import 'package:equalista/ConsulatantFiles/chatGPTModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

const backgroundColor = Colors.white;
const botBackgroundColor = Colors.white;

class C_homepage extends StatefulWidget {
  const C_homepage({super.key});

  @override
  State<C_homepage> createState() => _C_homepageState();
}

Future<String> generateResponse(String prompt) async {
  const apiKey = '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';

  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );

  // Do something with the response
  Map<String, dynamic> newresponse = jsonDecode(response.body);

  return newresponse['choices'][0]['text'];
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  final String text;
  final ChatMessageType chatMessageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.only(left: 10, right: 10,),
      color: chatMessageType == ChatMessageType.bot
          ? botBackgroundColor
          : backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          chatMessageType == ChatMessageType.bot
              ? Container(
            margin: const EdgeInsets.only(right: 10.0, top: 10),
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
              child: Text(
                'Bot',
              ),
            ),
          )
              : Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              child: Text("You")
            ),
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
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
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

class _C_homepageState extends State<C_homepage> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late bool isLoading;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: "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",
        baseOption: HttpSetup(receiveTimeout: Duration (seconds: 60000)));
    super.initState();
    isLoading = false;
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