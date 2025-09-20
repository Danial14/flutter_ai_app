import 'package:flutter/material.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
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
                /*style: TextStyle(
                  color: Colors.white
                ),*/
                textAlign: TextAlign.center,
                minLines: 2,
                maxLines: null,
                //controller: _chatController.textController,
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
              )
            ]
        )
    );
  }
}
