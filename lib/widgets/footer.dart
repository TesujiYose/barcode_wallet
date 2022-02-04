import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 8 / 4,
      children: [
        ...List.generate(11, (i) {
          return Container(
            color: i % 2 == 0 ? Colors.blue[100] : Colors.grey[100],
            child: Placeholder(),
          );
        }),
      ],
    );
  }
}
