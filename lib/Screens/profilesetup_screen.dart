import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_app/controllers/profilesetupcontroller.dart';
import 'package:hello_app/widgets/circle_image.dart';
import 'package:hello_app/widgets/custom_button.dart';
import 'package:hello_app/widgets/textfield.dart';

class ProfileSetupScreen extends StatelessWidget {
  final ProfileSetupcontroller profileSetupcontroller = Get.put(ProfileSetupcontroller());
  ProfileSetupScreen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 58, 61),
      body: SafeArea(
        
          child: Container(
            color: const Color.fromARGB(255, 61, 58, 61),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: 
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                    child: CircleImage(image: 'https://us.123rf.com/450wm/apoev/apoev2107/apoev210700049/171659475-stock-vector-default-avatar-photo-placeholder-gray-profile-picture-icon-man-in-t-shirt.jpg?ver=6'))
                  ),
                SliverToBoxAdapter(
                  child: CustomTextField(textEditingController: profileSetupcontroller.texteditingcontroller),
                ),
                const SliverToBoxAdapter(
                  child: CustomButton(),
                )
              ],
            ),
          )
        ),
    );
  }
}