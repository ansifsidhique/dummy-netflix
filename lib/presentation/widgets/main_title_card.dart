import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/title.dart';

import '../../core/constant_height_and width.dart';
import '../search/widgets/search_result.dart';
import 'main_card.dart';
class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SearchTextTitle(
          text: title,
        ),
        kHeight,
        LimitedBox(
            maxHeight: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const MainCard1(),
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return kWidth10;
              },
            )),
      ],
    );
  }
}
