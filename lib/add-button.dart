import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget{
  final Function(String,String) onSubmit;

  const InputDialog({super.key,required this.onSubmit});

  @override
  State<InputDialog> createState() => _InputDialogState();
}



class _InputDialogState extends State<InputDialog>{
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _desccontroller = TextEditingController();

  bool _isLoading = false;

  void _handlwSubmit() async{
    final name = _namecontroller.text.trim();
    final desc = _desccontroller.text.trim();

    if (name.isEmpty || desc.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      await widget.onSubmit(name,desc);
      if(context.mounted)Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error : $e'))
      );
    } finally {
      setState(() => _isLoading = false );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Data'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _namecontroller,
            cursorColor: Colors.black54,
            decoration: InputDecoration(
              labelText: 'Item Name',
              floatingLabelStyle: TextStyle(
                color: Colors.black
              ),
              border: OutlineInputBorder(), 
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(255, 23, 85, 191)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),

          const SizedBox(height: 16,),

          TextField(
            controller: _desccontroller,
            cursorColor: Colors.black54,
            decoration: InputDecoration(
              labelText: 'Description',
              floatingLabelStyle: TextStyle(
                color: Colors.black
              ),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(255, 23, 85, 191)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    ),

      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: Text('Cancel')
        ),
        ElevatedButton(
        onPressed: _isLoading ? null : _handlwSubmit, 
        child: _isLoading 
            ? const CircularProgressIndicator(strokeWidth: 2,)
            : const Text('Send'),
        )
      ],
    );
  }
}