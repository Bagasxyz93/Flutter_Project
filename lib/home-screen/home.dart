import 'package:flutter/material.dart';
import 'add-button.dart';
import '../data/models/repo.dart';
import '../data/models/item.dart';
import 'item-detail.dart';

class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key, required this.initialItems});
 final List<Item> initialItems;

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
        // Insert each item into the list and the AnimatedList
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
          
          return GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return ItemDetail(item: item);
              })
            );
            },
            child: SizeTransition(
              sizeFactor: animation,
              child: Card(
  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.all(32.16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Item name and delete button
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text('Are you sure you want to delete this item?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context,false), 
                          child: const Text('Cancel')
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context,true), 
                          child: const Text('Delete', style: TextStyle(color: Colors.red),)
                        )
                      ],
                      )
                    );
                  if(confirm != true) return;

                  final removedItem = listItem[index];
                  final success = await repository.deleteData(removedItem.id);
                  if (success) {
                    setState(() {
                      listItem.removeAt(index);
                      _listKey.currentState?.removeItem(
                        index,
                        (context, animation) => SizeTransition(
                          sizeFactor: animation,
                          child: Card(
                            child: ListTile(
                              title: Text(removedItem.name),
                              ),
                          ),
                        )
                      );
                    });
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to delete item'))
                    );
                  }
              },
            ),
          ],
        ),
        Text(
          item.description,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    ),
  ),
),
            ),
          );
           }
          ),
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
        backgroundColor: const Color.fromARGB(255, 39, 166, 225),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
