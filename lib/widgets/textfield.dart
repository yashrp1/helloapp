import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const CustomTextField({ Key? key, required this.textEditingController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
      child: TextFormField(
              controller: textEditingController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            iconColor: Colors.black,
                            labelText: 'Name',
                            hintText: 'Enter Your Name'
                          ),
              keyboardType: TextInputType.name,  
              
                
                ),
    );
  }
}