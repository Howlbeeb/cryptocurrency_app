import"package:flutter/material.dart";

import 'homepage.dart';

void main()=>runApp(CryptoApp());

class CryptoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),home: Homepage(),
    );  }
}
