import "package:flutter/material.dart";
import "package:flutter_ai_app/apis/apis.dart";
import "package:flutter_ai_app/models/message.dart";
import "package:get/get.dart";

class ChatController extends GetxController{
  final textController = TextEditingController();
  final RxList<Message> messages = <Message>[
    Message(msg: "How can I help you today", msgType: MessageType.bot)
  ].obs;

  void askQuestion() async{
    if(textController.text.trim().isNotEmpty){
      messages.add(Message(msg: textController.text, msgType: MessageType.user));
      messages.add(Message(msg: "Please wait", msgType: MessageType.bot));
      final res = await APIs.getAnswer(textController.text);
      messages.removeLast();
      messages.add(Message(msg: res, msgType: MessageType.bot));
    }
    textController.text = "";
  }
}