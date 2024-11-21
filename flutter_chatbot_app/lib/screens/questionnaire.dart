import 'package:flutter/material.dart';

class QuestionnaireScreen extends StatelessWidget {
  const QuestionnaireScreen({Key? key, required this.onSubmit}) : super(key: key);
  final Function(String feedback) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("この回答は役に立ちましたか？"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => onSubmit("はい"),
                child: Text("はい"),

              ),
              ElevatedButton(
                onPressed: () => onSubmit("いいえ"),
                child: Text("いいえ"),
                
              )
            ],
          )
        ],
      ),
    );
  }
}