import 'package:flutter/material.dart';
import 'dart:async';
import 'gradient_func.dart';
import 'package:pdamkotabaubau/home.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
} 

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), (){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const MyHomePage())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientContainer(
        colors: [
          Color.fromARGB(255, 110, 195, 255),
          Color.fromARGB(255, 39, 166, 225),
          Color.fromARGB(255, 9, 56, 185)
        ]
      ),
    );
  }
}