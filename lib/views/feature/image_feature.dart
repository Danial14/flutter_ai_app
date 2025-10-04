import 'package:flutter/material.dart';
import 'package:flutter_ai_app/controllers/image_controller.dart';
import 'package:flutter_ai_app/widgets/custom_loading.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../widgets/custom_button.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final ImageController _imageController = ImageController();
  Size? _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar : AppBar(
            title : const Text("AI Image Creator"),
          actions: [
            Obx((){
              return _imageController.status.value == imageStatus.completed ? IconButton(
                padding: EdgeInsets.only(right: 6),
                onPressed: (){
                  _imageController.shareImage();
                },
                icon: Obx((){
                  print("icon button build");
                  return _imageController.getImageSharingStatus ? CircularProgressIndicator() :
                  Icon(Icons.share);
                }),
              ) : SizedBox();
            })
          ],
        ),
        body : ListView(
            //controller: _chatController.scrollController,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                top: _size!.height * .02,
                bottom: _size!.width * .01,
              right: _size!.width * .04,
              left: _size!.width * .04
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
                height: _size!.height * 0.5,
                  alignment: Alignment.center,
                  child: Obx((){
                    return _aiImageWidget();
                  })
              ),
              CustomButton(
                onTap: _imageController.askQuestion,
                text: "Create",
              )
            ]
        ),
      floatingActionButton: Obx((){
        return _imageController.status.value == imageStatus.completed ? Padding(padding: const EdgeInsets.only(
          right: 6,
          bottom: 6,
        ),
        child: FloatingActionButton(onPressed: _imageController.downloadImage,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          backgroundColor: Colors.blueAccent,
          child: Obx((){
            print("download button build");
            return _imageController.getImageDownloadStatus ? CircularProgressIndicator()
                :
            Icon(Icons.download);
          })
        ),
        ) :
        SizedBox()
        ;
      })
    );
  }
 Widget _aiImageWidget(){
    return switch(_imageController.status.value){
      imageStatus.none => Lottie.asset("assets/lottie/ai_play.json", height: _size!.height * 0.3),
    imageStatus.loading => CustomLoading(),
    imageStatus.completed => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: _imageController.imageUrl,
        errorWidget: (_, _, _){
          return SizedBox();
        },
        placeholder: (_, _){
          return CustomLoading();
        },
      ),
    ),
    };
 }
}
