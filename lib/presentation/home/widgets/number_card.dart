import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/core/colors.dart';

import '../../../core/constant_height_and width.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 180,
            ),
            Container(
              width: 100,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://media.themoviedb.org/t/p/w220_and_h330_face/cMD9Ygz11zjJzAovURpO75Qg7rT.jpg"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 4,
          bottom: -26,
          child: BorderedText(
            strokeWidth: 11,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 90,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
