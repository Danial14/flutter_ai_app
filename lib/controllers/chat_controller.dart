import "package:flutter/material.dart";
import "package:flutter_ai_app/apis/apis.dart";
import "package:flutter_ai_app/models/message.dart";
import "package:get/get.dart";

import "../helper/mydialog.dart";

class ChatController extends GetxController{
  static bool isFirstTimeAnimating = true;
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final RxList<Message> messages = <Message>[
    Message(msg: "How can I help you today", msgType: MessageType.bot)
  ].obs;

  void askQuestion() async{
    if(textController.text.trim().isNotEmpty){
      messages.add(Message(msg: textController.text, msgType: MessageType.user));
      messages.add(Message(msg: "", msgType: MessageType.bot));
      _scrollDown();
      final res = await APIs.getAnswer(textController.text);
      messages.removeLast();
      ChatController.isFirstTimeAnimating = true;
      messages.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();
      textController.text = "";
    }
    else{
      MyDialog.showInfoDialog("Please ask something");
    }
  }
  void _scrollDown(){
    scrollController.animateTo(scrollController.position.maxScrollExtent * 1.4, duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
}