import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_ai_app/helper/mydialog.dart";
import "package:get/get.dart";
import 'package:http/http.dart' as http;
import "package:image_gallery_saver_plus/image_gallery_saver_plus.dart";

import "../helper/global.dart";

enum imageStatus {none, loading, completed}
class ImageController extends GetxController{
  final status = imageStatus.none.obs;
  static bool isFirstTimeAnimating = true;
  final textController = TextEditingController();
  String imageUrl = "";
  void askQuestion() async{
    try {
      if (textController.text
          .trim()
          .isNotEmpty) {
        status.value = imageStatus.loading;
        final response = await http.post(
            Uri.parse("https://api.freepik.com/v1/ai/mystic"),
            body: jsonEncode({
              "prompt": textController.text,
              "model": "realism"
            }),
            headers: {
              "x-freepik-api-key": FREEPIKAPIKEY,
              "Content-Type": "application/json"
            }
        );
        String taskId = jsonDecode(response.body)["data"]["task_id"];
        print("taskId : $taskId");
        await _pollImageTask(taskId);
        textController.text = "";
        status.value = imageStatus.completed;
      }
      else{
        MyDialog.showInfoDialog("Please provide some beautiful description");
      }
    }
    catch(e){
      textController.text = "";
      MyDialog.showErrorDialog("Error in generating image");
      status.value = imageStatus.none;
    }
  }
  Future<void> _pollImageTask(String taskId) async{
    try {
      while (true) {
        String url = "https://api.freepik.com/v1/ai/mystic/$taskId";
        final response = await http.get(Uri.parse(url),
          headers: {
            "x-freepik-api-key": FREEPIKAPIKEY,
            "Content-Type": "application/json"
          },
        );
        print("data : ${jsonDecode(response.body)}");
        var data = jsonDecode(response.body)["data"];
        if(data["status"] == "COMPLETED"){
          imageUrl = data["generated"][0];
          print("imageUrl : $imageUrl");
          return;
        }
        await Future.delayed(Duration(seconds: 3));
      }
    }
    catch(e){
      MyDialog.showErrorDialog("Error in generating image");
    }
  }
  Future<void> downloadImage() async{
    try{
      var imageBytes = (await http.get(Uri.parse(imageUrl))).bodyBytes;
      var result = await ImageGallerySaverPlus.saveImage(imageBytes, name: "ai_generated_image");
      print(result);
      MyDialog.showSuccessDialog("Image succesfully downloaded");
    }
    catch(e){

    }
  }
}