import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDAM ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 40, 78, 182),
          foregroundColor: Colors.white
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
