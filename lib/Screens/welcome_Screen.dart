import 'package:flutter/material.dart';
import 'package:hello_app/Screens/otpscreen.dart';
import 'package:hello_app/Screens/registration_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 61, 58, 61),
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0,50.0 , 10.0, 15.0),
            child: Text('Welcome To HelloApp',
                    style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                  ),
          ),
          Expanded(
            child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration:  BoxDecoration(
                        image: const DecorationImage(
                          // image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/61xoPkGaviL.png'),
                          image: NetworkImage('https://thumbs.dreamstime.com/b/five-people-group-chatting-sending-text-messages-holding-smart-phones-hands-typing-new-messages-using-phone-chat-texting-app-160463650.jpg'),

                          fit: BoxFit.fitWidth,
                        
                        ),
                        shape: BoxShape.circle,
                         border: Border.all(color: Colors.white, width: 4.0),
                      ),
                    ),
            ),
        Container(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 15.0),
            alignment: Alignment.center,
            child: const Text('Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
             style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,  
              ),
              textAlign: TextAlign.center,
              ),
          ),
        ButtonTheme(
            height: 40,
            minWidth: MediaQuery.of(context).size.width * 0.65,
            child: TextButton(onPressed: () => {
             Navigator.pushNamed(context, 'RegistrationScreen')
                          
          },
            style: ElevatedButton.styleFrom(
                   primary: Colors.lightBlueAccent,
                   onSurface: Colors.red,
                   ), 
            child: const Text("AGREE AND CONTINUE",style: TextStyle(color: Colors.white),),
        ),
        ),  
        SizedBox(height: 40,)
        ],
      ),
    );
  }
}