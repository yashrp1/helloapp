
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  

  late TextEditingController otpdigit1;
  late TextEditingController otpdigit2;
  late TextEditingController otpdigit3;
  late TextEditingController otpdigit4;
  late TextEditingController otpdigit5;
  late TextEditingController otpdigit6;
  late FocusNode otpdigit1focus;
  late FocusNode otpdigit2focus;
  late FocusNode otpdigit3focus;
  late FocusNode otpdigit4focus;
  late FocusNode otpdigit5focus;
  late FocusNode otpdigit6focus;


  



  @override
  void onInit() {
    super.onInit();
    otpdigit1 = TextEditingController();
    otpdigit2 = TextEditingController();
    otpdigit3 = TextEditingController();
    otpdigit4 = TextEditingController();
    otpdigit5 = TextEditingController();
    otpdigit6 = TextEditingController();

    otpdigit1focus = FocusNode();
    otpdigit2focus = FocusNode();
    otpdigit3focus = FocusNode();
    otpdigit4focus = FocusNode();
    otpdigit5focus = FocusNode();
    otpdigit6focus = FocusNode();
  }

  @override
  void onClose() {
    otpdigit1.dispose();
    otpdigit2.dispose();
    otpdigit3.dispose();
    otpdigit4.dispose();
    otpdigit5.dispose();
    otpdigit6.dispose();
    super.onClose();
  }          
  
 String getotp()
 {
   return otpdigit1.text+otpdigit2.text+otpdigit3.text+otpdigit4.text+otpdigit5.text+otpdigit6.text;
 }
 

  
}