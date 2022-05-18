import 'package:bloc_volunteer_service/presentaion/nottifications/WithoutIconWidget.dart';
import 'package:bloc_volunteer_service/presentaion/nottifications/WithIconWidget.dart';
import 'package:bloc_volunteer_service/presentaion/nottifications/text_input.dart';

import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:flutter/material.dart';

import '../../core/constant.dart';

/// IN THIS THERE ARE THREE WIDGETS 1. WITHICON WIDGETS 2. WITHOUT ICON WIDGET  3.TEXTINPUT

class Nottifications extends StatelessWidget {
  const Nottifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "NOTIFICATIONS",
          icon2: Icons.search,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: const [
              /// TEXT
              Align(
                alignment: Alignment.topLeft,
                child: TextInput(
                  size: 15,
                  text1: 'Today',
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// WITHOUT ICON WIDGET

              WithoutIconWidget(
                paraBold: textOnStarting,
                text2: "Didn't you deliver",
                paragraph: textonparagraph,
                time: "7 minutes ago",
              ),
              Divider(),

              /// WITH ICON WIDGET

              WithIconWidget(
                parabold: textOnStarting,
                time: "7 minutes ago",
                paragraph: textonparagraph,
                image1: "images/logo.png",
                color1: Colors.white,
                text2: "Good job!",
              ),
              Divider(),
              WithoutIconWidget(
                text2: "Hi Brawn, please",
                paraBold: textOnStarting,
                paragraph: textonparagraph,
                time: "7 minutes ago",
              ),
              Divider(),
              WithIconWidget(
                paragraph: textonparagraph,
                time: "7 minutes ago",
                parabold: textOnStarting,
                text2: "Floria Fernandas",
                image1: "images/logo.png",
                color1: Colors.white,
              ),
              Divider(),
              WithoutIconWidget(
                text2: "You got a gift, want to see ?",
                time: "7 minutes ago",
              ),
              Divider(),
              WithoutIconWidget(
                text2: "Hi Brawn, please",
                time: "7 minutes ago",
              ),
            ]),
          ),
        ));
  }
}
