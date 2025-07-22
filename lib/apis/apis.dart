import 'dart:convert';
import 'dart:io';

import 'package:flutter_ai_app/helper/global.dart';
import 'package:http/http.dart' as http;
class APIs{
  static void getAnswer(String question) async{
    print("get answer called");
    try{
      var res = await http.post(Uri.parse("https://api.openai.com/v1/chat/completions"), headers: {
        HttpHeaders.contentTypeHeader : "application/json",
        HttpHeaders.authorizationHeader : "Bearer ${CHATGPTAPIKEY}"
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": question
          }
        ]
      })
      );
      if(res.statusCode == 200){
        print("chatgpt response");
        print(jsonDecode(res.body));
      }
      else{
        print("req not sent ${res.body}");
      }
    }
    catch(e){
      print("error");
      print(e);
    }
  }
}