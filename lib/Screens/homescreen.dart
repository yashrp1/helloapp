// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hello_app/Screens/chatscreen.dart';
import 'package:hello_app/controllers/tabcontroller.dart';
import 'package:hello_app/widgets/appbar_search.dart';

enum HomeOptions {
  settings,
  // Chats Tab
  newGroup,
  newBroadcast,
  whatsappWeb,
  starredMessages,
  // Status Tab
  statusPrivacy,
  // Calls Tab
  clearCallLog,
  readMe,
}

class HomeScreen extends StatelessWidget {

    
    final Tabcontroller tabController = Get.put(Tabcontroller());

  // TabController? _tabController;
  bool showFab = true;
  
  bool _searhBarOpen = false;
    int _tabIndex = 1;

   List<Widget>? _actionButtons;
   
   TextEditingController _searchBarController = new TextEditingController();

   final List<List<PopupMenuItem<HomeOptions>>> _popupMenus = [
      [],
      [
        const PopupMenuItem<HomeOptions>(
          value: HomeOptions.newGroup,
          child: Text("New group"),
        ),
        const PopupMenuItem<HomeOptions>(
          value: HomeOptions.newBroadcast,
          child: Text("New broadcast"),
        ),
        PopupMenuItem<HomeOptions>(
          key: Key('Web'),
          value: HomeOptions.whatsappWeb,
          child: Text("WhatzApp Web"),
        ),
        PopupMenuItem<HomeOptions>(
          key: Key('Starred'),
          value: HomeOptions.starredMessages,
          child: Text("Starred messages"),
        ),
        PopupMenuItem<HomeOptions>(
          key: Key('Settings'),
          value: HomeOptions.settings,
          child: Text("Settings"),
        ),
        PopupMenuItem<HomeOptions>(
          value: HomeOptions.readMe,
          child: Text("README", style: TextStyle(color: Colors.red)),
        ),
      ],
      [
        PopupMenuItem<HomeOptions>(
          value: HomeOptions.statusPrivacy,
          child: Text("Status privacy"),
        ),
        PopupMenuItem<HomeOptions>(
          value: HomeOptions.settings,
          child: Text("Settings"),
        ),
        PopupMenuItem<HomeOptions>(
          value: HomeOptions.readMe,
          child: Text("README", style: TextStyle(color: Colors.red)),
        ),
      ],
      [
        PopupMenuItem<HomeOptions>(
          value: HomeOptions.clearCallLog,
          child: Text("Clear call log"),
        ),
        PopupMenuItem<HomeOptions>(
          value: HomeOptions.settings,
          child: Text("Settings"),
        ),
        PopupMenuItem<HomeOptions>(
          value: HomeOptions.readMe,
          child: Text("README", style: TextStyle(color: Colors.red)),
        ),
      ],
    ];

  HomeScreen({Key? key}) : super(key: key);

 




        // _searchBarController = new TextEditingController();


    
    
  
    
  

  void _selectOption(HomeOptions option) {
    switch (option) {
      case HomeOptions.newGroup:
        
        
        break;
      case HomeOptions.newBroadcast:
       
        break;
      case HomeOptions.whatsappWeb:
        
        break;
      case HomeOptions.starredMessages:
        
        break;
      case HomeOptions.settings:
        
        break;
      case HomeOptions.statusPrivacy:
        
        break;
      case HomeOptions.clearCallLog:
        
        break;
      case HomeOptions.readMe:
        
        break;
    }
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_searhBarOpen) {
         
          return false;
        } else {
          return true;
        }
      },
      child: Obx(()=> Scaffold(
          appBar: AppBar(
            backgroundColor: tabController.isSearching.value ? Colors.white : Color.fromARGB(255, 69, 66, 69),
            title: tabController.isSearching.value ? SearchBar(searchBarController: _searchBarController): Text('HelloApp'),
      
            leading: tabController.isSearching.value ? 
                     IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: const Color(0xff075e54),
                        onPressed: () {
                         
                            tabController.resetsearchbar();
                         
                        },
                      ) : null,
            elevation: 0.7,
            bottom: tabController.isSearching.value ? null : TabBar(
              controller: tabController.controller,
              indicatorColor: Colors.white,
              tabs: tabController.myTabs,
            ),  
            actions: tabController.isSearching.value ? null : _actionButtons = <Widget>[
            InkWell(
            onTap: () => { tabController.updatesearchbar(),} ,
            child: Icon(Icons.search),
            ),
            PopupMenuButton<HomeOptions>(
             key: Key('moreOptions'),
             tooltip: "More options",
             itemBuilder: (BuildContext context) {
              return _popupMenus[tabController.controller.index];
              },
             ),
            ]
          ),
            body: TabBarView(
             controller: tabController.controller,
             children: const <Widget>[
              ChatScreen(),
              ChatScreen(),
              ChatScreen(),
              ChatScreen(),
            ],
          ),
          floatingActionButton: showFab
              ? FloatingActionButton(
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  onPressed: () => print("open chats"),
                )
              : null,
        ),)
      
    );
  }
}

