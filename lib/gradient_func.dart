import 'package:flutter/material.dart';
import 'package:pdamkotabaubau/style_text.dart';

class GradientContainer extends StatelessWidget{
 const GradientContainer({super.key});

 @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                  Color.fromARGB(204, 33, 149, 243),
                  Color.fromARGB(255, 87, 149, 255),
                  Color.fromARGB(255, 25, 109, 252)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft

            ),
          ),
          child: const Center(
            child: textStyle('HelloWorld'),
          )
        );
  }
}

