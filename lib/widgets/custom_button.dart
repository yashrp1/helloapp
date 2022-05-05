import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // final VoidCallback onpress;
  const CustomButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(45, 15, 45, 5),
      child: FlatButton(onPressed: () {
        
      },
        child: const Text('Continue'),
        color: Colors.lightBlueAccent,
        )
    );
  }
}