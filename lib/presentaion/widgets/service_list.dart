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
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Image.network(
                                homeModel!.data![0][index].imageName != null
                                    ? homeModel!.data![0][index].imageName
                                        .toString()
                                    : homeModel!.misc!.imagePlaceholder
                                        .toString()),
                          ),
                          Container(
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
                                  text1: homeModel!.data![0][index].taskTitle!
                                      .toUpperCase()),
                            ),
                          )
                        ]),
                  ),

                  // Column(
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.grey),
                  //           borderRadius: const BorderRadius.only(
                  //             topLeft: Radius.circular(10),
                  //             topRight: Radius.circular(10),
                  //           )),
                  //       height: 147,
                  //       width: 160,
                  //       child: Image.network(
                  //           homeModel!.data![0][index].imageName != null
                  //               ? homeModel!.data![0][index].imageName.toString()
                  //               : homeModel!.misc!.imagePlaceholder.toString()),
                  //     ),
                  //     Container(
                  //       height: 48,
                  //       width: 160,
                  //       decoration: const BoxDecoration(
                  //           color: primaryColor,
                  //           borderRadius: BorderRadius.only(
                  //               bottomLeft: Radius.circular(10),
                  //               bottomRight: Radius.circular(10))),
                  //       child: Center(
                  //           child: Padding(
                  //         padding: const EdgeInsets.all(5.0),
                  //         child: Text(
                  //           homeModel!.data![0][index].taskTitle.toString(),
                  //           maxLines: 2,
                  //           style: const TextStyle(
                  //               color: Colors.white, fontSize: 15),
                  //         ),
                  //       )),
                  //     )
                  //   ],
                  // ),
                ));
  }
}
