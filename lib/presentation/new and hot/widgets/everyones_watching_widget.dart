
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constant_height_and width.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          "Friends",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight,
        Text(
          "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work,life in 1990s Manhattan. ",
          style: TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
                iconSize: 25, titleSize: 16, icon: Icons.share, title: "Share"),
            kWidth10,
            CustomButtonWidget(
                iconSize: 25,
                titleSize: 16,
                icon: CupertinoIcons.add,
                title: "My List"),
            kWidth10,
            CustomButtonWidget(
                iconSize: 25,
                titleSize: 16,
                icon: CupertinoIcons.play,
                title: "play"),
            kWidth10
          ],
        )
      ],
    );
  }
}
