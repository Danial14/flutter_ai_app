import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/feature/chatbot_feature.dart';
import '../views/feature/image_feature.dart';
import '../views/feature/language_translator.dart';


enum HomeType{
  aiChatBot,
  aiImage,
  aiTranslator
}

extension MyHomeType on HomeType{
  String get title{
    return switch(this){
      HomeType.aiChatBot => "Ai ChatBot",
      HomeType.aiImage => "Ai Image Creator",
      HomeType.aiTranslator => "Ai Translator",
    };
  }
  String get lottie{
    return switch(this){
      HomeType.aiChatBot => "ai_hand_waving",
      HomeType.aiImage => "ai_play",
      HomeType.aiTranslator => "ask_ai"
    };
  }
  bool get leftAlign{
    return switch(this){
      HomeType.aiChatBot => false,
      HomeType.aiImage => true,
      HomeType.aiTranslator => false
    };
  }
  VoidCallback get onTap{
    return switch(this){
      HomeType.aiChatBot => () => Get.to(()=>ChatbotFeature()) ,
      HomeType.aiImage => () => Get.to(()=>ImageFeature()),
      HomeType.aiTranslator => () =>Get.to(()=>LanguageTranslatorFeature())
    };
  }
}