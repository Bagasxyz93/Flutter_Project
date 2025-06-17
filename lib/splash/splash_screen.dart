import 'package:flutter/material.dart';
import 'package:pdamkotabaubau/models/item.dart';
import 'package:pdamkotabaubau/repo.dart';
import 'gradient_func.dart';
import 'package:pdamkotabaubau/home.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
} 

class _SplashScreenState extends State<SplashScreen>{
  final Repo repository = Repo();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async{
    try {
      final List<Item> items = await repository.getData();

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder:(context) => MyHomePage(initialItems: items) )
        );
      }
    } catch (e) {
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengambil data : $e'))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          GradientContainer(
            colors: [
              Color.fromARGB(255, 110, 195, 255),
              Color.fromARGB(255, 39, 166, 225),
              Color.fromARGB(255, 9, 56, 185)
            ]
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 350),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        ],
      )
    );
  }
}