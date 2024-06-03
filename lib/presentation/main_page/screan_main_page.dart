import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloades/screen_downloads.dart';
import 'package:netflix/presentation/fast%20laughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new%20and%20hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});
  final _pages =  [
   const ScreenHomePage(),
    const ScreenNewAndHotPage(),
    const ScreenFastLaughPage(),
   const   ScreenSearchPage(),
     ScreenDownloadPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
        bottomNavigationBar:const
        BottomNavigationWidgets(),
      ),
    );
  }
}
