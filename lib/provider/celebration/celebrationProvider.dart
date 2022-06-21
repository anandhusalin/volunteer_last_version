import 'package:bloc_volunteer_service/model/celebration/celebrationSliderModel.dart';
import 'package:bloc_volunteer_service/presentaion/celebration_detail_page/screen_celebration_page.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/celebration/celebrationWidget.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/moving_card.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CelebrationProvider with ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  setpageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  Widget celebrationMainContainer = FutureBuilder<CelebrationSliderModel>(
      future: ApiService().getCelebrationList(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.data!.isNotEmpty) {
          var items = snapshot.data!.data;
          return CarouselSlider(
              items: List.generate(
                items!.length,
                (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CelebrationSystemDetail(
                                  items: items[index],
                                )));
                  },
                  child: BannerCard(
                    url: 'images/Servicebnr.jpg',
                    item: items[index],
                  ),
                ),
              ),
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
                scrollDirection: Axis.horizontal,
              ));
        } else {
          return SizedBox();
        }
      });

  Widget celebrationSmallContainer = FutureBuilder<CelebrationSliderModel>(
      future: ApiService().getCelebrationList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.data;
          return Container(
            height: 85,
            child: CarouselSlider(
              items: List.generate(
                  data!.length,
                  (index) => CelebrationWidget(
                        name: data[index].name.toString(),
                        serviceDescription: data[index].taskDesc.toString(),
                        celebrationWidgetAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CelebrationSystemDetail(
                                        items: data[index],
                                      )));
                        },
                      )),
              options: CarouselOptions(
                height: 85,
                aspectRatio: 16 / 4,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      });
}
