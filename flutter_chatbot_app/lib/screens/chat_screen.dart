import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post_content.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen>{
    final TextEditingController _controller = TextEditingController();
    final List<Message> _messages = [];

    String? _lastUserMessage;
    String? _lastBotResponse;

    // ユーザーのメッセージ投稿
    void _sendMessage(String message){
        _controller.clear();
        setState(() {
            _messages.add(Message(message: message, questionnaire: false));
            _lastUserMessage = message;
        });

        _getBotResponse(message);
        _controller.clear();
    }

    // ボットのメッセージ投稿
    void _getBotResponse(String message){
        //ボットの回答　APIで取得する場合はここを変更
        final String response = 'Hello, I am a chatbot.';

        setState(() {
            _messages.add(Message(message: response, questionnaire: true));
            _lastBotResponse = response;
        });

        //アンケート表示呼び出し
    }

    //アンケート表示
    //API機能追加
    // void _showQuestionnaire(){
    //     showModalBottomSheet(
    //         context: context,
    //         builder: builder
    //     );
    // }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: const Text('Chatbot'),
            ),
            body: Column(
                children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                            itemCount: _messages.length,
                            itemBuilder: (BuildContext context, int index){
                                final Message message = _messages[index];
                                return Container(
                                    alignment: message.questionnaire ? Alignment.centerRight : Alignment.centerLeft,
                                    child: Text(message.message),
                                );
                            },
                        ),
                    ),
                    TextField(
                        controller: _controller,
                        onSubmitted: _sendMessage,
                        decoration: const InputDecoration(
                            hintText: 'Enter your message',
                        ),
                    ),
                ],
            ),
        );
    }

}