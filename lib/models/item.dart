import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  Item({
    required this.name,
    required this.secret,
    required this.shortDesc,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  String shortDesc;
  @HiveField(2)
  String secret;
}
