import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_app/Screens/homescreen.dart';
import 'package:hello_app/Screens/otpscreen.dart';
import 'package:hello_app/Screens/profilesetup_screen.dart';
import 'package:hello_app/route/router.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;



  // final String phoneNumber;
 

Future<void> phoneSignIn({required String phoneNumber, required BuildContext context}) async {
     _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;
    
    if (authCredential.smsCode != null) {
      try{
      UserCredential credential =
          await user!.linkWithCredential(authCredential);
      }on FirebaseAuthException catch(e){
          if(e.code == 'provider-already-linked'){
            await _auth.signInWithCredential(authCredential);
          }
      }  
      
        
    }
  }
    
  

  _onCodeSent(String verificationId, int? forceResendingToken) {
    print(forceResendingToken);
    print("code sent");
    Navigator.push(context,
                          MaterialPageRoute(builder: (_) => OtpScreen(verificationId: verificationId),));
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

    void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        });
  }

     _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
  }
    
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: await _onVerificationCompleted,
        verificationFailed:  _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

 
void signInWithPhoneAuthCredential(String verificationId,
      String otp,BuildContext context) async {
   
   PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: otp);

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      

      if(authCredential.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileSetupScreen()));
      }

    } on FirebaseAuthException catch (e) {
      

      
    }
  }


}