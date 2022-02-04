import 'package:barcode_wallet/models/item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:barcode_wallet/screens/add_code_screen.dart';
import 'package:barcode_wallet/widgets/footer.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item.name'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddCodeScreen()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Placeholder(
            fallbackHeight: MediaQuery.of(context).size.height - 80 - 103,
          ),
          Container(
            height: 103,
            width: double.infinity,
            child: Footer(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Hive.openBox('codesBox');

          var box = Hive.box('codesBox');
          List<Item> _codes = box.get('codes');
          print(_codes.length);
        },
      ),
    );
  }
}
