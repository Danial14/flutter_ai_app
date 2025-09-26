import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog{
  static void showInfoDialog(String message){
    Get.snackbar("Info", message, colorText: Colors.white, backgroundColor: Colors.blue.withOpacity(0.8));
  }
  static void showSuccessDialog(String message){
    Get.snackbar("Info", message, colorText: Colors.white, backgroundColor: Colors.green.withOpacity(0.8));
  }
  static void showErrorDialog(String message){
    Get.snackbar("Info", message, colorText: Colors.white, backgroundColor: Colors.red.withOpacity(0.8));
  }
}