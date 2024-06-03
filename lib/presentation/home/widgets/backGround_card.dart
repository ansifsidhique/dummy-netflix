import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constant_height_and width.dart';
import 'custom_button_widget.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(kImage), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(

                  title: "My List",
                  icon: Icons.add,
                ),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: "Info",)
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style:
    ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
      color: kBlackColor,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        "play",
        style: TextStyle(fontSize: 20, color: kBlackColor),
      ),
    ),
  );
}

