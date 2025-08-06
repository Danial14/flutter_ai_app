import 'dart:convert';
import 'dart:io';

import 'package:flutter_ai_app/helper/global.dart';
import 'package:http/http.dart' as http;

import '../models/gemini_text_response_model.dart';
class APIs{
  static Future<String> getAnswer(String question) async{
    String response = "";
    print("get answer called");
    try{
      var res = await http.post(Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent"), headers: {
        HttpHeaders.contentTypeHeader : "application/json",
        "X-goog-api-key" : "${GEMINIAPIKEY}"
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text": question
              }
            ]
          }
        ]
      })
      );
      if(res.statusCode == 200){
        print("gemini response");
        GeminiTextGenerationResponse geminiTextGenerationResponse = GeminiTextGenerationResponse.fromJson(jsonDecode(res.body));
        geminiTextGenerationResponse.candidates?.map((candidate){
          candidate.content?.parts?.map((part){
            response = part.text!;
          }).toList();
        }).toList();
      }
      else{
        print("req not sent ${res.body}");
      }
    }
    catch(e){
      print("error");
      print(e);
    }
    return response;
  }
}