import 'package:flutter/material.dart';

class CommonComponent{
  static AppBar appbar(String title){
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Merienda'
        ),
        ),
      centerTitle: true,
      backgroundColor:const Color(0xFF38929B),
    );
  }
  static void navigateTo(BuildContext context, Widget page) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => page),
      );
}