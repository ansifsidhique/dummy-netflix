import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast%20laughs/widgets/video_List_item.dart';

class ScreenFastLaughPage extends StatelessWidget {
  const ScreenFastLaughPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            20,
            (index) => VideoListItem(
              index: index,
            ),
          ),

        ),
      ),
    );
  }
}


//https://gist.github.com/jsturgis/3b19447b304616f18657