import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_app/Screens/otpscreen.dart';
import 'package:hello_app/services/Authenication.dart';

class RegistraionScreen extends StatefulWidget {
  const RegistraionScreen({ Key? key }) : super(key: key);

  @override
  State<RegistraionScreen> createState() => _RegistraionScreenState();
}

class _RegistraionScreenState extends State<RegistraionScreen> {
  final TextEditingController _phonenumbercontroller = TextEditingController();
  final AuthService _auth = AuthService();


    String? _validatePhoneNumber(String? value) {
    final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value!)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 61, 58, 61),
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0,40.0 , 10.0, 15.0),
              child: Text('Enter your phone number',
               style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,  
                ),
                ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
              alignment: Alignment.center,
              child: const Text('HelloApp will send an SMS message to verify your phone number.',
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,  
                  ),
                  ),
              
            ),
            Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _phonenumbercontroller,
                              restorationId: 'phone_number_field',
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  
                                  iconColor: Colors.black,
                                  labelText: 'Phone Number',
                                  
                                ),
                              keyboardType: TextInputType.phone,  
                              maxLength: 14,
                              maxLengthEnforcement: MaxLengthEnforcement.none,
                              validator: _validatePhoneNumber
                
                ),
                          ],
                        ),
                      ),
              
          
          Container(
            
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 60.0),
            child: ElevatedButton(onPressed: () => {
              _auth.phoneSignIn(phoneNumber: _phonenumbercontroller.text, context: context)
              
              
            }, 
              child: const Text("NEXT"),
              ),
          )  
          ],
        ),
      ),
    );
  }
}