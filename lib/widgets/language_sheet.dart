import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/translator_controller.dart';

class LanguageSheet extends StatelessWidget {
  final TranslatorController translatorController;
  final RxString fromOrTo;

  LanguageSheet({super.key, required this.translatorController, required this.fromOrTo});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RxString _search = "".obs;
    print("build language sheet : ${fromOrTo.value}");
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
              print("Search : ${s}");
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
                print("empty search");
                languages = translatorController.lang;
              }
              return ListView.builder(
              itemBuilder: (ctx, position){
    return InkWell(
      onTap: (){
        fromOrTo.value = languages[position];
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
