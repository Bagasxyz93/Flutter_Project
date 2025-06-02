import 'package:flutter/material.dart';

import 'package:pdamkotabaubau/gradient_func.dart';

void main(){
  runApp(
    const   MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [
          Color.fromARGB(255, 110, 195, 255),
          Color.fromARGB(255, 39, 166, 225),
          Color.fromARGB(255, 9, 56, 185)
        ],),
      ),
    ),
  );
}

