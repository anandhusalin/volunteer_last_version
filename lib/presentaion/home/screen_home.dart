import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/celebration_model.dart';
import 'package:bloc_volunteer_service/presentaion/mainpage/widgets/bottom_nav.dart';

import 'package:bloc_volunteer_service/presentaion/view_all/screen_view_all.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/category_section.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/service_list.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/moving_card.dart';
import '../widgets/search_bar.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;

  CelebrationModel? celebrationModel;
  List celebration = [];

  int index = 0;

  /// CELEBRATION SYSTEM  MOVING CARD

  Widget movingCard() {
    return CarouselSlider(
        items: [
          for (var i = 0; i < celebration.length; i++)
            Container(
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("images/Servicebnr.jpg"),
                    opacity: 180,
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      height: 150,
                      width: 120,
                      child: Image.asset(
                        "images/Servicebnr.jpg",
                        fit: BoxFit.fill,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          celebrationModel!.name![1],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: "Poppins"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              fontFamily: "Poppins"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          GestureDetector(
              onTap: () {},
              child: const BannerCard(url: 'images/Servicebnr.jpg')),
          GestureDetector(
              onTap: () {},
              child: const BannerCard(url: 'images/Servicebnr.jpg')),
          GestureDetector(
              onTap: () {},
              child: const BannerCard(url: 'images/Servicebnr.jpg')),
          GestureDetector(
              onTap: () {},
              child: const BannerCard(url: 'images/Servicebnr.jpg')),
          GestureDetector(
              onTap: () {},
              child: const BannerCard(url: 'images/Servicebnr.jpg')),
        ],
        options: CarouselOptions(
          height: 170,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (value, _) {
            setState(() {
              index = value;
            });
          },
          scrollDirection: Axis.horizontal,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(title: 'WELCOME')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ConstSize.kheight2,

              /// SEARCH BAR

              const SearchBar(text1: "Search your Services"),
              const SizedBox(
                height: 15,
              ),

              /// CELEBRATION SYSTEM

              movingCard(),

              /// POPULAR SERVICE HEADING

              const HomeSection3(),

              /// POPULAR SERVICE LIST

              const ServiceList(),

              /// CATEGORY HEADING

              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'CATEGORY',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),

              /// CATEGORY SECTION

              const CategorySection(),
            ],
          ),
        ));
  }
}

/// POPULAR SERVICE HEADING

class HomeSection3 extends StatelessWidget {
  const HomeSection3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'POPULAR SERVICES',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "Poppins"),
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    indexChangeNotifier.value = 4;

                    ChangeNotifier();

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ViewAll
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
    );
  }
}
