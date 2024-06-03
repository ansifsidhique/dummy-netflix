import 'package:flutter/material.dart';

import 'package:netflix/core/colors.dart';

import 'package:netflix/presentation/new%20and%20hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new%20and%20hot/widgets/everyones_watching_widget.dart';

import '../../core/constant_height_and width.dart';

class ScreenNewAndHotPage extends StatelessWidget {
  const ScreenNewAndHotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: _newAndHotAppbarWidget(),
          body: TabBarView(
            children: [_buildComingSoon(), _buildEveryOnceWatching()],
          )),
    );
  }



  AppBar _newAndHotAppbarWidget() {
    return AppBar(
          title: const Text(
            "New & Hot",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: kWhiteColor),
          ),
          actions: [
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
          bottom: TabBar(
              labelColor: kBlackColor,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              labelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius20,
              ),
              tabs: const [
                Tab(
                  text: "  🍿Coming Soon    ",
                ),
                Tab(
                  text: "👀Everyone's Watching",
                ),
              ]),
        );
  }




  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (context, index) => const ComingSoonWidget(),
      shrinkWrap: true,
      itemCount: 10,
    );
  }
}



Widget _buildEveryOnceWatching() {
  return ListView.builder(
    itemCount: 22,
    itemBuilder: (context,index) {
      return const EveryonesWatchingWidget();
    }
  );
}
