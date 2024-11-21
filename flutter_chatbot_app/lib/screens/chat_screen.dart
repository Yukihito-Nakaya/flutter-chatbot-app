import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'questionnaire.dart';
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

        _showQuestionnaire();
    }

        //アンケート表示
    void _showQuestionnaire(){
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
                return QuestionnaireScreen(
                    onSubmit: (String feedback){
                        //アンケート結果を保存
                        //API機能追加
                    },
                );
            },
        );
    }


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
                                return Align(
                                    alignment: message.questionnaire ? Alignment.centerLeft: Alignment.centerRight,
                                    child: Container(
                                        margin:EdgeInsets.symmetric(vertical:4,horizontal: 8),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: message.questionnaire ? Colors.blue : Colors.grey,
                                            borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(message.message),
                                    ),
                                );
                            },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            children: [
                                Expanded(
                                    child: TextField(
                                        controller: _controller,
                                        maxLines: null,
                                        decoration: const InputDecoration(
                                            hintText: 'メッセージを入力してください',
                                        ),
                                    ),
                                ),
                                IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: (){
                                        _sendMessage(_controller.text);
                                    },
                                ),
                            ],
                        ),
                        ),
                ],
            ),
        );
    }

}