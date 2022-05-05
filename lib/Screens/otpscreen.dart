
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_app/controllers/otpcontroller.dart';
import 'package:hello_app/services/Authenication.dart';

class OtpScreen extends StatelessWidget {
  
  final AuthService _auth = AuthService();
  final OtpController otpController = Get.put(OtpController());
  // TextEditingController _otp = TextEditingController();
  final String verificationId;

   OtpScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 58, 61),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                        color: Color.fromARGB(255, 61, 58, 61),
                        margin: const EdgeInsets.fromLTRB(15, 40, 15, 0),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                        children: [
                          const Text(
                             "Verification Code",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               
                               fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        const SizedBox(height: 30,),
                        const Text(
                             "Please enter the OTP sent to your registered mobile number",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               
                               fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                              focusNode: otpController.otpdigit1focus,
                              controller: otpController.otpdigit1,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,  
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 1,
                              onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(otpController.otpdigit2focus);
                               },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                              focusNode: otpController.otpdigit2focus,
                              controller: otpController.otpdigit2,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,  
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 1,
                              onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(otpController.otpdigit3focus);
                               },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                              focusNode: otpController.otpdigit3focus,
                              controller: otpController.otpdigit3,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,  
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 1,
                              onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(otpController.otpdigit4focus);
                               },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                              focusNode: otpController.otpdigit4focus,
                              controller: otpController.otpdigit4,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,  
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 1,
                              onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(otpController.otpdigit5focus);
                               },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                              focusNode: otpController.otpdigit5focus,
                              controller: otpController.otpdigit5,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,  
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 1,
                              onFieldSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(otpController.otpdigit6focus);
                               },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                focusNode: otpController.otpdigit6focus,
                              controller: otpController.otpdigit6,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,  
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 1,
                              
                              ),
                            ),
                            
                          ],
                        ),
                                ],
                              ),
                            ),
                      
                      ButtonTheme(
            height: 40,
            minWidth: MediaQuery.of(context).size.width * 0.65,
            child: TextButton(onPressed: () => {
            _auth.signInWithPhoneAuthCredential(verificationId,otpController.getotp(), context)
                          
          },
            style: ElevatedButton.styleFrom(
                   primary: Colors.lightBlueAccent,
                   onSurface: Colors.red,
                   ), 
            child: const Text("Verify",style: TextStyle(color: Colors.white),),
        ),
        ),
          ],
        ),
      ),
    );
  }
}