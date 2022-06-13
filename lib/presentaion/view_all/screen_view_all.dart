import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/model/celebration/celebrationSliderModel.dart';
import 'package:bloc_volunteer_service/presentaion/view_all/widgets/view_all_listing_services.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/service_list.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';

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
    return FutureBuilder<CelebrationSliderModel>(
        future: ApiService().getCelebrationList(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.data!.isNotEmpty) {
            var items = snapshot.data!.data;
            return CarouselSlider(
                items: [
                  for (var i = 0; i < items!.length; i++)
                    GestureDetector(
                      onTap: () {},
                      child: BannerCard(
                        url: 'images/Servicebnr.jpg',
                        item: items[i],
                      ),
                    ),
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
          } else {
            return SizedBox();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "SERVICES",
        icon2: Icons.search,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
