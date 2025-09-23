import 'package:flutter/material.dart';
import 'package:flutter_ai_app/controllers/image_controller.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/custom_button.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final ImageController _imageController = ImageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar : AppBar(
            title : const Text("AI Image Creator")
        ),
        body : ListView(
            //controller: _chatController.scrollController,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                top: size.height * .02,
                bottom: size.width * .01,
              right: size.width * .04,
              left: size.width * .04
            ),
            children : [
              TextFormField(
                controller: _imageController.textController,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                minLines: 2,
                maxLines: null,
                //controller: _chatController.textController,
                onTapOutside: (e){
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  hintText: "Imagine it. We’ll create it. ✨",
                  hintStyle: TextStyle(fontSize: 18.5,
                  )
                ),
              ),
              Container(
                height: size.height * 0.5,
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/lottie/ai_play.json", height: size.height * 0.3)
              ),
              CustomButton(
                onTap: (){

                },
                text: "Create",
              )
            ]
        )
    );
  }
}
