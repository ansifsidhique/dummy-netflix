import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    required this.icon,
    required this.title,
    super.key,
     this.iconSize=30,
     this.titleSize=18,
  });
  final IconData icon;
  final String title;
  final double iconSize;
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style:  TextStyle(
            fontSize: titleSize,
          ),
        )
      ],
    );
  }
}
