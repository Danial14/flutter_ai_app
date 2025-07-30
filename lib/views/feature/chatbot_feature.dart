import 'package:flutter/material.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});
  @override
  State<ChatbotFeature> createState() {
    return _ChatbotFeatureState();
  }
}

class _ChatbotFeatureState extends State<ChatbotFeature>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Expanded(child: TextFormField(
            onTapOutside: (e){
              FocusScope.of(context).unfocus();
            },
          ))
        ],
      ),
        appBar : AppBar(
            title : const Text("Chat with AI Assistant")
        ),
        body : ListView(
            children : [

            ]
        )
    );
  }
}
