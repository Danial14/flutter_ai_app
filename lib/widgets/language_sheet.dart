import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/translator_controller.dart';

class LanguageSheet extends StatelessWidget {
  final TranslatorController translatorController;
  final String fromOrTo;

  RxString _search = "".obs;
  LanguageSheet({super.key, required this.translatorController, required this.fromOrTo});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        right: size.width * 0.04,
        left: size.width * 0.04,
        top: size.height * 0.02
      ),
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),
        topLeft: Radius.circular(20)
        )
      ),
      child: Column(
        children: [
          TextFormField(
            onChanged: (s){
              _search.value = s;
            },
            onTapOutside: (_){
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: "Search language...",
          border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
              prefixIcon: Icon(Icons.translate, color: Colors.blue,)
      )
          ),
          Expanded(
            child: Obx((){
              List<String> languages = [];
              if(_search.value.isNotEmpty){
                languages = translatorController.lang.where((lang){
                  return lang.toLowerCase().startsWith(_search.value.toLowerCase());
                }).toList();
              }
              else{
                languages = translatorController.lang;
              }
              return ListView.builder(
              itemBuilder: (ctx, position){
    return InkWell(
      onTap: () async{
        if(fromOrTo.contains("From")){
         // call translator api here
          await translatorController.translateText(translatorController.textController.text, languages[position]);
          translatorController.from.value = languages[position];
        }
        else{
          translatorController.to.value = languages[position];
        }
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(languages[position]),
      ),
    );
    },
    itemCount: languages.length,
    );
    }),
          )
        ],
      )
    );
  }
}
