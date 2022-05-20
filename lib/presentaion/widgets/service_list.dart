import 'package:bloc_volunteer_service/model/home_screen_model.dart';

import 'package:bloc_volunteer_service/services/home_services.dart';
import 'package:flutter/material.dart';

import '../nottifications/text_input.dart';
import '../service_info/screen_service_info.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  final PopularServiceService homeService = PopularServiceService();
  bool isLoading = true;

  PopularServiceModel? homeModel;
  List joji = [];

  @override
  void initState() {
    super.initState();
    homeService.getData().then((value) {
      setState(() {
        homeModel = value;

        isLoading = false;

        joji = homeService.joji;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: joji.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskPage(
                                  ServiceId: homeModel!.data![0][index].id,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.network(
                                homeModel!.data![0][index].imageName != null
                                    ? homeModel!.data![0][index].imageName
                                        .toString()
                                    : homeModel!.misc!.imagePlaceholder
                                        .toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextInput(
                                      colorOfText: Colors.white,
                                      maxlines: true,
                                      size: 13,
                                      text1: homeModel!
                                          .data![0][index].taskTitle!
                                          .toUpperCase()),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ));
  }
}
