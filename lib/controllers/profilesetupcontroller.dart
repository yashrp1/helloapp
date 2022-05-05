
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupcontroller extends GetxController{
  

  late TextEditingController texteditingcontroller;

  @override
  void onInit() {
    super.onInit();
    texteditingcontroller = TextEditingController();
  }

  @override
  void onClose() {
    texteditingcontroller.dispose();
    super.onClose();
  }          
  

 

  
}