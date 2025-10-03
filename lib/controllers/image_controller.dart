import "dart:convert";
import 'dart:io';
import "package:flutter/material.dart";
import "package:flutter_ai_app/helper/mydialog.dart";
import "package:get/get.dart";
import 'package:http/http.dart' as http;
import "package:image_gallery_saver_plus/image_gallery_saver_plus.dart";
import "package:path_provider/path_provider.dart";
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';

import "../helper/global.dart";

enum imageStatus {none, loading, completed}
enum imageDownloadingAndSharingStatus {none, downloading, sharing}
class ImageController extends GetxController{
  final status = imageStatus.none.obs;
  final downloadingAndSharingStatus = imageDownloadingAndSharingStatus.none.obs;
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
      downloadingAndSharingStatus.value = imageDownloadingAndSharingStatus.downloading;
      var imageBytes = (await http.get(Uri.parse(imageUrl))).bodyBytes;
      var result = await ImageGallerySaverPlus.saveImage(imageBytes, name: "ai_generated_image");
      print(result);
      MyDialog.showSuccessDialog("Image succesfully downloaded");
    }
    catch(e){
      MyDialog.showErrorDialog("Error in downloading image");
    }
    downloadingAndSharingStatus.value = imageDownloadingAndSharingStatus.none;
  }
  Future<void> shareImage() async{
    try{
      downloadingAndSharingStatus.value = imageDownloadingAndSharingStatus.sharing;
      var imageBytes = (await http.get(Uri.parse(imageUrl))).bodyBytes;
      var tempDir = await getTemporaryDirectory();
      var imageFile = await File("${tempDir.path}/ai_generated_image.png").writeAsBytes(imageBytes);
      final params = ShareParams(
        text: 'ai generated image',
        files: [XFile(imageFile.path)],
      );

      final result = await SharePlus.instance.share(params);

      if (result.status == ShareResultStatus.success) {
        MyDialog.showSuccessDialog("Image succesfully shared");
      }
      else{
        MyDialog.showErrorDialog("Error in sharing image");
      }
    }
    catch(e){
      MyDialog.showErrorDialog("Error in sharing image");
    }
    downloadingAndSharingStatus.value = imageDownloadingAndSharingStatus.none;
  }
}