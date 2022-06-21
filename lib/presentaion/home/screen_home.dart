import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/celebration/celebrationSliderModel.dart';
import 'package:bloc_volunteer_service/model/celebration_model.dart';
import 'package:bloc_volunteer_service/presentaion/celebration_detail_page/screen_celebration_page.dart';
import 'package:bloc_volunteer_service/presentaion/mainpage/widgets/bottom_nav.dart';

import 'package:bloc_volunteer_service/presentaion/view_all/screen_view_all.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/category_section.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/celebration/celebrationWidget.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/service_list.dart';
import 'package:bloc_volunteer_service/provider/celebration/celebrationProvider.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  Future<CelebrationModel>? celebrationModel;
  List celebration = [];
  CelebrationSliderModel? _celebrationSliderModel;

  int index = 0;
  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    _celebrationSliderModel = await ApiService().getCelebrationList();
  }

  /// CELEBRATION SYSTEM  MOVING CARD

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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

              Provider.of<CelebrationProvider>(context)
                  .celebrationMainContainer,

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
              const SizedBox(height: 10),
              Provider.of<CelebrationProvider>(context)
                  .celebrationSmallContainer,
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
