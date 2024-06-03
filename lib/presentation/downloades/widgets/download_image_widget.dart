import 'dart:math';

import 'package:flutter/material.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
        required this.imageList,
        this.angle = 0,
        required this.margin,
        required this.width,
        required this.height,
        required this.borderRadias});
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final double width;
  final double height;
  final double borderRadias;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
          margin: margin,
          width: size.width * width,
          // .4,.6
          height: size.width * height,
          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(borderRadias),
              // color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageList)))),
    );
  }
}
