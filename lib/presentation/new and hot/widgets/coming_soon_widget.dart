
import 'package:flutter/cupertino.dart';


import '../../../core/colors.dart';
import '../../../core/constant_height_and width.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kGreyColor),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tall Girl 2",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonWidget(
                            iconSize: 20,
                            titleSize: 8,
                            icon: CupertinoIcons.bell,
                            title: "Remind Me"),
                        SizedBox(
                          width: 20,
                        ),
                        CustomButtonWidget(
                          icon: CupertinoIcons.info,
                          title: "info ",
                          titleSize: 8,
                          iconSize: 20,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
               Text("Coming on Friday"),
              kHeight,
               Text(
                "Tall Girl 2",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
               Text(
                "Landing the lead in the school musical is a dream come true for jodi, until the pressure sends her confidence -and relationship -into a talispin.",
                style: TextStyle(color: kGreyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
