import 'package:flutter/material.dart';
import 'icon.dart';

class GradientContainer extends StatelessWidget{
 const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

 @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:colors,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            ),
          ),
          child: Center(
            child:const iconContainer(),
          ),
        );
  }
}

