import 'package:flutter/cupertino.dart';

import '../../../core/constant_height_and width.dart';
import '../../widgets/title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          text: "Top 10 Tv India Today",
        ),
        kHeight,
        LimitedBox(
            maxHeight: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => NumberCard(
                index: index,
              ),
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return kWidth10;
              },
            )),
      ],
    );
  }
}
