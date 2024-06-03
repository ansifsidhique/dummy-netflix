import 'package:flutter/material.dart';

import '../../core/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://media.themoviedb.org/t/p/w1920_and_h800_multi_faces/zNueX4mKKQlBqHRmeSziGCHmbiz.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 5,
          bottom: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black.withOpacity(.5),
            child: IconButton(
              onPressed: () {},
              color: kWhiteColor,
              icon: const Icon(
                Icons.volume_off,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
