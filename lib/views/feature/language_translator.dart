import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/translator_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/language_sheet.dart';

class LanguageTranslatorFeature extends StatefulWidget {
  const LanguageTranslatorFeature({super.key});

  @override
  State<LanguageTranslatorFeature> createState() => _LanguageTranslatorFeatureState();
}

class _LanguageTranslatorFeatureState extends State<LanguageTranslatorFeature> {
  final _translateController = TranslatorController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar : AppBar(
            title : const Text("Multi Language Translator")
        ),
        body : ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              top: size.height * .02,
              bottom: size.width * .01,
              right: size.width * .04,
              left: size.width * .04
          ),
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.bottomSheet(LanguageSheet(translatorController: _translateController, fromOrTo: "From",));
                    },
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                        width: size.width * 0.4,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Obx((){
                          return _translateController.from.isEmpty ? const Text("Auto")
                              :
                          Text(_translateController.from.value);
                        })
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.repeat_rounded)),
                  InkWell(
                    onTap: (){
                      Get.bottomSheet(LanguageSheet(translatorController: _translateController, fromOrTo: "To",));
                    },
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                        width: size.width * 0.4,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Obx((){
                          return _translateController.to.isEmpty ? const Text("To")
                              :
                          Text(_translateController.to.value);
                        })
                    ),
                  )
                ]
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01,
              vertical: size.height * 0.025
              ),
              child: /*Obx((){
                return TextFormField(
                  controller: _translateController.textController,
                  minLines: 5,
                  maxLines: null,
                  //controller: _chatController.textController,
                  onTapOutside: (e){
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      hintText: "Translate anything you want.",
                      hintStyle: TextStyle(fontSize: 18.5,
                      )
                  ),
                );
              })*/
              TextFormField(
              controller: _translateController.textController,
              minLines: 5,
              maxLines: null,
              //controller: _chatController.textController,
              onTapOutside: (e){
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  hintText: "Translate anything you want.",
                  hintStyle: TextStyle(fontSize: 18.5,
                  )
              ),
            )
            ),
            if(_translateController.resultController.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01,
                    vertical: size.height * 0.015
                ),
                child: TextFormField(
                  controller: _translateController.resultController,
                  onTapOutside: (e){
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                  ),
                ),
              ),
            SizedBox(
              height: size.height * 0.1,
            ),
            CustomButton(
              onTap: (){},
              text: "Translate",
            )
          ],
        )
    );
  }
}
