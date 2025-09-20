import 'package:flutter/material.dart';
import 'package:flutter_ai_app/controllers/chat_controller.dart';
import 'package:flutter_ai_app/widgets/message_card.dart';
import "package:get/get.dart";
import 'package:flutter_gemini/flutter_gemini.dart';


class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});
  @override
  State<ChatbotFeature> createState() {
    return _ChatbotFeatureState();
  }
}

class _ChatbotFeatureState extends State<ChatbotFeature>{
  final _chatController = ChatController();
  @override
  Widget build(BuildContext context) {

    print("build chatbot feature");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
            children: [
              SizedBox(width: 10,),
              Expanded(child: TextFormField(
                /*style: TextStyle(
                  color: Colors.white
                ),*/
                textAlign: TextAlign.center,
                controller: _chatController.textController,
                onTapOutside: (e){
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  isDense : true,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  hintText: "Ask me something",
                  //hintStyle: TextStyle(color: Colors.white)
                ),
              ),
              ),
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 24,
                child: IconButton(onPressed: _chatController.askQuestion, icon: Icon(
                  Icons.rocket_launch,
                  size: 28,
                  color: Colors.white,
                )),
                backgroundColor: Colors.blue,
              )
            ],
        ),
      ),
        appBar : AppBar(
            title : const Text("Chat with AI Assistant")
        ),
        body : Obx(
            () => ListView.builder(
              controller: _chatController.scrollController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: size.height * .02,
                bottom: size.width * .01
              ),
              itemBuilder : (context, position){
                print("ListView build");
                if(position == _chatController.messages.length - 1) {
                  Widget messageCard = MessageCard(
                      message: _chatController.messages[position], ChatController.isFirstTimeAnimating
                  );
                  ChatController.isFirstTimeAnimating = false;
                  return messageCard;
                }
                else{
                  return MessageCard(
                      message: _chatController.messages[position], false
                  );
                }
              },
              itemCount: _chatController.messages.length,
          ),
        )
    );
  }
}
