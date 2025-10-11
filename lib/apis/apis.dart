import 'dart:convert';
import 'dart:io';

import 'package:flutter_ai_app/helper/global.dart';
import 'package:http/http.dart' as http;

import '../models/gemini_text_response_model.dart';
import '../models/gemini_translator_response.dart';
class APIs{
  static final String APIENDPOINT = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";
  static Future<String> getAnswer(String question) async{
    String response = "";
    print("get answer called");
    try{
      var res = await http.post(Uri.parse(APIENDPOINT), headers: {
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
  static Future<String> getTranslation(String question, String to) async{
    String response = "";
    print("get translator called");
    try{
      var res = await http.post(Uri.parse(APIENDPOINT), headers: {
        HttpHeaders.contentTypeHeader : "application/json",
        "X-goog-api-key" : "${GEMINIAPIKEY}"
      },
          body: jsonEncode({
            "system_instruction": {
              "parts": [
                {
                  "text": "You are a professional language translator. Your task is to translate the user's input into ${to}. Output ONLY the translation in a clean String. Do not include any explanations or extra text."
                }
              ]
            },
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
        print("gemini translator response");
        GeminiTranslatorResponse geminiTranslatorResponse = GeminiTranslatorResponse.fromJson(jsonDecode(res.body));
        geminiTranslatorResponse.candidates?.map((candidate){
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