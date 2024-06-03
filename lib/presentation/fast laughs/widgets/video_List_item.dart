import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // left side
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black.withOpacity(.5),
                    child: IconButton(
                      onPressed: () {},
                      color: kWhiteColor,

                      icon: const Icon(Icons.volume_off,size: 30,),
                    ),
                  ),
                  //   /right side
                const  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w220_and_h330_face/gKkl37BQuKTanygYQG1pyYgLVgf.jpg"),
                        ),
                      ),
                      VideoActionsWidget(
                          icon: Icons.emoji_emotions, title: "LOL"),
                      VideoActionsWidget(icon: Icons.add, title: "My List"),
                      VideoActionsWidget(icon: Icons.share, title: "Share"),
                      VideoActionsWidget(icon: Icons.play_arrow, title: "Play"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16
                , color: kWhiteColor),
          )
        ],
      ),
    );
  }
}
