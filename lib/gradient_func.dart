import 'package:flutter/material.dart';

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
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.9),
                borderRadius: BorderRadius.circular(35),
                boxShadow:[BoxShadow(
                    color: Colors.black45,
                    blurRadius: 15,
                    offset: Offset(3,7)
                  ), 
                ],
              ),
              child: Image.asset(
                'assets/image/pdambaubau.png',
                width: 120,
                height: 120,
              ),
            ),
          ),
        );
  }
}

