import 'package:flutter/material.dart';
import '../data/models/item.dart';

import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({required this.item,super.key});

  final Item item;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.item.name} Detail',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Divider(
                  color: Colors.blue.shade200,
                  thickness: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}