import 'package:flutter/material.dart';
import 'add-button.dart';
import 'repo.dart';
import 'models/item.dart';

class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  List<Item> listItem = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  Repo repository = Repo();

  @override
  void initState() {
    super.initState();
    getData();
  }
  
  getData() async{
    try {
      final items = await repository.getData();

      for (int i = 0; i < items.length; i++) {
        print('Insert item at index $i: ${items[i].name}');
        listItem.insert(i, items[i]);
        _listKey.currentState?.insertItem(i);
        await Future.delayed(const Duration(milliseconds: 100));
      }
    setState(() {});
    } catch (e) {
      if(context.mounted){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'))
            ],
          ),
        );
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter listView with JSON'),
      ),
      body:AnimatedList(
        key: _listKey,
        initialItemCount: listItem.length, 
         itemBuilder: (context, index, animation){
          final item = listItem[index];
          
          return SizeTransition(
            sizeFactor: animation,
            child:Card(
              margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              child:Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32.16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    item.name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    item.description,
                    style: TextStyle(
                      color: Colors.grey.shade600
                      ),
                    )

                  ],
                ),
               )
              )
            );
           }
        ) ,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (context){
              return InputDialog(
                onSubmit: (name,desc) async{
                  final newItem = await repository.postData(name, desc); 
                  if(newItem != null){
                    setState(() {
                      listItem.insert(0, newItem);
                      _listKey.currentState?.insertItem(0);
                    });
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed Add Data'))
                    );
                  }
              }
            );
          });
        }, 
        backgroundColor: Colors.lightBlue.shade300,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
