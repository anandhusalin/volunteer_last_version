import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/view_all/widgets/view_all_listing_services.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/service_list.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/moving_card.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  int index = 0;
  Widget movingCard() {
    return CarouselSlider(
        items: [
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
            // print(value);
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
      appBar: const CustomAppBar(
        title: "SERVICES",
        icon2: Icons.search,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            movingCard(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Services',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const ViewAllServiceList(),
            // const ServiceList()
          ],
        ),
      ),
    );
  }
}
