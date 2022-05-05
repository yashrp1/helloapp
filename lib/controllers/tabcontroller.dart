
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tabcontroller extends GetxController with GetSingleTickerProviderStateMixin{
  RxBool isSearching = false.obs;
  
  RxBool searchBarOpen = false.obs;
                            
  final List<Tab> myTabs = <Tab>[
    const Tab(icon: Icon(Icons.camera_alt),),
    const Tab(text: "CHATS"),
    const Tab(text: "STATUS"),
    const Tab(text: "CALLS"),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }          
  

  updatesearchbar() {
    if(isSearching.isTrue){
    isSearching.value = false;
        searchBarOpen.value = false;

    }
    else if(isSearching.isFalse)
    {
      isSearching.value = true;
      searchBarOpen.value = true;


    }
  }

  resetsearchbar() {
    isSearching.value = false;
    searchBarOpen.value = false;
    
  }
}