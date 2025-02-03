import 'package:flutter/material.dart';
import 'package:random_quote_generator/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // deactivate debug banner 
      debugShowCheckedModeBanner: false,
      home: HomePage(), 
    );
  }
}