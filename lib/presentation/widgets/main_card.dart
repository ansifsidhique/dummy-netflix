import 'package:flutter/material.dart';

import '../../core/constant_height_and width.dart';

class MainCard1 extends StatelessWidget {
  const MainCard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              "https://media.themoviedb.org/t/p/w220_and_h330_face/nIp4gIXogCjfB1QABNsWwa9gSca.jpg"),
        ),
      ),
    );
  }
}
