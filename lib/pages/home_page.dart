
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // variables
  final String quoteURL = "https://zenquotes.io/api/random";
  String _displayText = "Press for Random Quote";
  String _authorOfQuote = "";

  //method
  generateQuote() async {
    var response = await http.get(Uri.parse(quoteURL));
    var result = jsonDecode(response.body);

    setState(() {
      // Assign quote to variable
      _displayText = result[0]["q"];

      // Assign author to variable
      _authorOfQuote = "- " + result[0]["a"];
      // print(result);
    });
  }

  //UI
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote Generator"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[400],
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(          
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                _displayText,
              ),

              const SizedBox(height: 15,),

              Text(
                _authorOfQuote,
                style: TextStyle(
                  fontSize: 16,                 
                ),
              ),

              const SizedBox(height: 30,),
        
              ElevatedButton(
                onPressed: generateQuote,
                child: Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  "Generate",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                ),
              ),
            ],
          ),
        ),
      ),      
    );
  }
}
