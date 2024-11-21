import 'package:flutter/material.dart';

void main() {
  runApp(const ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatbotScreen(),
    );
  }
}
