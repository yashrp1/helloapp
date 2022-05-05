import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  
  final TextEditingController searchBarController;
  const SearchBar({ Key? key, required this.searchBarController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
     controller: searchBarController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        suffixIcon: IconButton(
      onPressed:() {
        
        searchBarController.clear();
      },
      icon: Icon(Icons.clear),
    ),
      ),
    );
  }
}