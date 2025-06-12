import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDAM Baubau',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
