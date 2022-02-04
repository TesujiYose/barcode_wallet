import 'package:flutter/material.dart';

import './screens/dashboard_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/item.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashbordScreen(),
    );
  }
}
