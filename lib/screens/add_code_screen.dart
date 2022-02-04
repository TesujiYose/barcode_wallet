import 'package:barcode_wallet/models/item.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class AddCodeScreen extends StatelessWidget {
  AddCodeScreen({Key? key}) : super(key: key);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _shortDescController = TextEditingController();
  TextEditingController _secretController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Barcode item'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextFormField(
            controller: _shortDescController,
            decoration: InputDecoration(hintText: 'Description'),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _secretController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(hintText: ''),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.camera_alt_outlined))
            ],
          ),
          TextButton(
            onPressed: () async {
              await Hive.openBox('codesBox');

              var box = Hive.box('codesBox');
              var item = Item(
                name: _nameController.text,
                shortDesc: _shortDescController.text,
                secret: _secretController.text,
              );
              List<Item> _codes =
                  box.containsKey('codes') ? await box.get('codes') : [];

              _codes.add(item);
              await box.put('codes', _codes);
              Navigator.of(context).pop();
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
