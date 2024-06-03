import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constant_height_and%20width.dart';
import 'package:netflix/presentation/home/widgets/backGround_card.dart';

import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      builder: (context, index, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackGroundCard(),
                  // Released in the Past Year Section
                  MainTitleCard(
                    title: "Released in the past year",
                  ),
                  kHeight,
                  // Trending Now section
                  MainTitleCard(
                    title: "Trending Now",
                  ),
                  kHeight,
                  // Top 10 Tv india section

                  NumberTitleCard(),

                  // Tense Dramas section
                  MainTitleCard(
                    title: "Tense Now",
                  ),
                  // South indian cinema
                  MainTitleCard(
                    title: "South Indian Cinema",
                  ),
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN7x3aMu7ftyHTYpQ_49MmeGVstu_IMQNIH9KAOZ1i0g&s",
                                width: 70,
                                height: 70,
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Tv Shows",
                                style: kHomeTitleText,
                              ),
                              Text(
                                "Movies",
                                style: kHomeTitleText,
                              ),
                              Text(
                                "Categories",
                                style: kHomeTitleText,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight
            ],
          ),
        );
      },
      valueListenable: scrollNotifier,
    ));
  }
}
