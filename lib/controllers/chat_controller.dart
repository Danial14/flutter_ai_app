import "package:flutter/material.dart";
import "package:flutter_ai_app/models/message.dart";
import "package:get/get.dart";

class ChatController extends GetxController{
  final textController = TextEditingController();
  final RxList<Message> messages = <Message>[].obs;

  void askQuestion(){
    if(textController.text.trim().isNotEmpty){
      messages.add(Message(msg: textController.text, msgType: MessageType.user));
      messages.add(Message(msg: "I recieved your message", msgType: MessageType.bot));
    }
  }
}