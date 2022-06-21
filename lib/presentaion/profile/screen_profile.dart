import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/profile/profileModel.dart';
import 'package:bloc_volunteer_service/presentaion/contactUs/screenContactUs.dart';
import 'package:bloc_volunteer_service/presentaion/mainpage/widgets/bottom_nav.dart';
import 'package:bloc_volunteer_service/presentaion/profile/widgets/profile_button.dart';

import 'package:bloc_volunteer_service/presentaion/widgets/service_list.dart';
import 'package:bloc_volunteer_service/presentaion/wishlist/screenWishlist.dart';
import 'package:bloc_volunteer_service/provider/celebration/celebrationProvider.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_profile/view_profile.dart';
import '../widgets/app_bar_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required List user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<ProfileModel>? _profileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "PROFILE",
        icon2: Icons.search,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<ProfileModel>(
                future: ApiService().getProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(height: 10.0),
                        buildProfileHead(snapshot.data!.data),
                        buildProfileGrid(),
                      ],
                    );
                  }
                  return SizedBox();
                }),

            const SizedBox(
              height: 20,
            ),

            /// ON GOING SERVICE HEADING
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'On Going Services',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            indexChangeNotifier.value = 4;
                            ChangeNotifier();
                          },
                          child: const Text('View All')),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            /// POPULAR SERVICE LIST
            ServiceList(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Celebrations',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Provider.of<CelebrationProvider>(context).celebrationSmallContainer,
          ],
        ),
      ),
    );
  }

  buildProfileHead(Data? data) {
    return Row(
      children: [
        ConstSize.kwidth,
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ViewProfile()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello,',
                style: TextStyle(color: backgroundColor2, fontSize: 25),
              ),
              Text(
                '${data!.name}',
                style: TextStyle(color: primaryColor, fontSize: 25),
              ),
            ],
          ),
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
            // alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                '${data.imageName}',
                fit: BoxFit.cover,
                errorBuilder: (context, ob, st) {
                  return Text(
                    data.name!.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        ConstSize.kwidth,
      ],
    );
  }

  buildProfileGrid() {
    return Column(
      children: [
        ConstSize.kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileButton(
              text1: 'Profile',
              icon: Icons.account_box,
              buttonAction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewProfile()));
              },
            ),
            ProfileButton(
              text1: 'Wishlist',
              icon: Icons.favorite,
              buttonAction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WishListScreen()));
              },
            ),
          ],
        ),
        ConstSize.kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileButton(
              text1: 'Contact us',
              icon: Icons.contact_support_outlined,
              buttonAction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUsScreen()));
              },
            ),
            ProfileButton(
              text1: 'Support',
              icon: Icons.support,
              buttonAction: () {},
            ),
          ],
        ),
      ],
    );
  }
}

/// HELLO , ANANDHU PART

/// FOUR BUTTON PART

