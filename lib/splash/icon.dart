import 'package:flutter/material.dart';


class iconContainer extends StatelessWidget{
    const iconContainer({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255 ,255, 255, 255,),
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
            );
    }
}