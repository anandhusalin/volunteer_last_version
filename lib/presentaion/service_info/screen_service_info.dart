import 'dart:developer';

import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/chat.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/moving_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/service_info_model.dart';
import '../../services/service_info_service.dart';
import '../widgets/app_bar2_widget.dart';

class TaskPage extends StatefulWidget {
  final ServiceId;
  const TaskPage({Key? key, required this.ServiceId}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int index = 0;
  final ServiceInfoService serviceInfoService = ServiceInfoService();
  bool isLoading = true;
  ServiceInfoModel? serviceInfoModel;
  Future<ServiceInfoModel>? serviceInfoDetails;
  List serviceInfoList = [];

  @override
  void initState() {
    super.initState();
    serviceInfoDetails = serviceInfoService.getServiceInfo(widget.ServiceId);
    // serviceInfoService.getServiceInfo().then((value) {
    //   setState(() {
    //     serviceInfoModel = value;
    //     isLoading = false;
    //     serviceInfoList = serviceInfoService.serviceList;
    //   });
    //   if (serviceInfoModel != null) {
    //     // ignore: avoid_print

    //     print(
    //         "//////////////////////////////////////////////////////////////////////////////////////");
    //     print(serviceInfoModel!.data![0].taskTitle.toString());
    //     print(
    //         "/////////////////////////////////////////////////////  END /////////////////////////////////");
    //   }
    // });
  }

  Widget movingCard(images, misc) {
    if (images.isNotEmpty) {
      return CarouselSlider(
          items: images.map<Widget>((element) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${element.imageName}'),
                    // opacity: 180,
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: Colors.grey)),
            );
          }).toList(),
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
    } else {
      return Container(
        height: 170,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('${misc.imagePlaceholder}'),
              // opacity: 180,
              fit: BoxFit.contain,
            ),
            border: Border.all(color: Colors.grey)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        appbarLeadingButtonFunction: () {
          Navigator.pop(context);
        },
        title: "SERVICE",
        icon: Icons.arrow_back_ios,
        icon2: Icons.search,
      ),
      body: FutureBuilder<ServiceInfoModel>(
          future: serviceInfoDetails,
          builder: (context, snapshot) {
            if ((snapshot.hasData)) {
              var data = snapshot.data?.data![0];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height: 200,
                    //   width: MediaQuery.of(context).size.width,
                    //   decoration: const BoxDecoration(
                    //       color: primaryColor,
                    //       image: DecorationImage(
                    //           fit: BoxFit.fill,
                    //           image: AssetImage('images/Servicebnr.jpg'))),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    movingCard(data!.images, snapshot.data?.misc),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${data.taskTitle}',
                                // serviceInfoModel!.data![0].taskTitle.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.favorite_border,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Chat(
                                                  serviceId: data.id,
                                                  serviceTitle: data.taskTitle,
                                                )));
                                  },
                                  child: const Text(
                                    'VOLUNTEER',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
                                    Icons.lock_clock,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${data.estDuration}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const Text(
                                        ' min',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              height: 70,
                              width: 80,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Estimated Duration')
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
                                    Icons.home_repair_service,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Active',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              height: 70,
                              width: 80,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Service Status')
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${data.taskDesc}',
                        // serviceInfoModel!.data![0].taskDesc.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   height: 200,
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: const EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       image: const DecorationImage(
                    //           fit: BoxFit.fill,
                    //           image: AssetImage('images/service4.jpg'))),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(horizontal: 15),
                    //   child: const Text(
                    //     'hai',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
