import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "CONTACT US",
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: height * 0.10,
          // ),
          Container(
            height: height * 0.75,
            width: double.infinity,
            // color: Colors.yellow,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: width,
                  // color: Colors.red,
                  child: Image.asset('images/volunteer.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                buildContactUsTextWidget(),
                buildSocialIconWidget(width),
              ],
            ),
          ),
          buildFooterWidget(height)
        ],
      ),
    );
  }

  buildFooterWidget(height) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 35,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: const Text(
            'Design and developed by Cyber Fort Technologies',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 10,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }

  buildContactUsTextWidget() {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  buildSocialIconWidget(double width) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: width * 0.50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildContactSocialIconsWidget('images/google.jpg'),
          buildContactSocialIconsWidget('images/fb.jpg'),
          buildContactSocialIconsWidget('images/insta.png')
        ],
      ),
    );
  }

  buildContactSocialIconsWidget(image) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: primaryColor,
            blurRadius: 1.0,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(image),
      ),
    );
  }
}
