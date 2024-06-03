import 'package:flutter/material.dart';

import 'package:netflix/core/constant_height_and%20width.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth10,
        Container(
          color: Colors.blue,
          height: 30,
          width: 30,
        ),
        kWidth10
      ],
    );
  }
}
