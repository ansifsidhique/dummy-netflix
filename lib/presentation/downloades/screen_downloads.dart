import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constant_height_and%20width.dart';

import 'package:netflix/presentation/widgets/app_bar_widgets.dart';
import 'package:netflix/presentation/downloades/widgets/download_image_widget.dart';

import '../../core/strings.dart';

class ScreenDownloadPage extends StatelessWidget {
  ScreenDownloadPage({super.key});
  final _widgetList = [
    const SmartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length),
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "See What You Can Download",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          style: TextStyle(
              color: kWhiteColor, fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          " We'll download a personalised selection of\n movies "
          "and shows for you, so there's\n always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.downloads.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SizedBox(
              width: size.width,
              height: size.width,
              child:
                  // state.isLoading?const Center(child:  CircularProgressIndicator()):
                  Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: size.width * .383,
                      backgroundColor: Colors.grey.withOpacity(.6),
                    ),
                  ),
                  DownloadsImageWidget(
                    height: .6,
                    width: .4,
                    imageList:
                        "$kimageAppentUrl${state.downloads[0].posterPath}",
                    angle: 20,
                    margin: const EdgeInsets.only(left: 120, bottom: 30),
                    borderRadias: 10,
                  ),
                  DownloadsImageWidget(
                    width: .4,
                    height: .6,
                    imageList:
                        "$kimageAppentUrl${state.downloads[1].posterPath}",
                    angle: -20,
                    margin: const EdgeInsets.only(right: 120, bottom: 30),
                    borderRadias: 10,
                  ),
                  DownloadsImageWidget(
                    height: .6575,
                    width: .4,
                    imageList:
                        "$kimageAppentUrl${state.downloads[2].posterPath}",
                    angle: 0,
                    margin: const EdgeInsets.only(
                      left: 0,
                    ),
                    borderRadias: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      kWidth10,
      Icon(
        Icons.settings,
        color: kButtonColorWhite,
      ),
      kWidth10,
      Text("Smart Downloads for you")
    ]);
  }
}
