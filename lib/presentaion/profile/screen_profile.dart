import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/presentaion/profile/widgets/profile_button.dart';

import 'package:bloc_volunteer_service/presentaion/widgets/service_list.dart';
import 'package:flutter/material.dart';
import '../view_profile/view_profile.dart';
import '../widgets/app_bar_widgets.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required List user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "PROFILE",
        icon2: Icons.search,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ConstSize.kheight,

              /// HELLO ANANDHU PART
              ProfileSection1(),

              /// PROFLE, WISHLIST, SETTINGS, WISHLIST , SUPPORT PART
              ProfileSection3(),
              SizedBox(
                height: 20,
              ),

              /// ON GOING SERVICE HEADING
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'On Going Services',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),

              SizedBox(
                height: 20,
              ),

              /// POPULAR SERVICE LIST
              ServiceList(),
            ],
          ),
        ),
      ),
    );
  }
}

/// HELLO , ANANDHU PART

class ProfileSection1 extends StatelessWidget {
  const ProfileSection1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          ConstSize.kwidth,
          const Text(
            'Hello,',
            style: TextStyle(color: backgroundColor2, fontSize: 25),
          ),
          const Text(
            ' Anandhu',
            style: TextStyle(color: primaryColor, fontSize: 25),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewProfile()));
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(50)),
            ),
          ),
          ConstSize.kwidth,
        ],
      ),
    );
  }
}

/// FOUR BUTTON PART

class ProfileSection3 extends StatelessWidget {
  const ProfileSection3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstSize.kheight,
        ConstSize.kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ProfileButton(
              text1: 'Profile',
              icon: Icons.account_box,
            ),
            ProfileButton(
              text1: 'Wishlist',
              icon: Icons.favorite,
            ),
          ],
        ),
        ConstSize.kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ProfileButton(
              text1: 'Settings',
              icon: Icons.settings,
            ),
            ProfileButton(
              text1: 'Support',
              icon: Icons.support,
            ),
          ],
        ),
      ],
    );
  }
}
