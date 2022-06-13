import 'dart:developer';

import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/service_info/widget/serviceTaskTile.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/chat.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/moving_card.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
  bool isLoading = false;
  ServiceInfoModel? serviceInfoModel;
  Future<ServiceInfoModel>? serviceInfoDetails;
  List serviceInfoList = [];
  final box = GetStorage();
  late int user_id;

  @override
  void initState() {
    super.initState();
    user_id = box.read('user_id');
    serviceInfoDetails = serviceInfoService.getServiceInfo(widget.ServiceId);
  }

  Widget movingCard(images, misc) {
    if (images.isNotEmpty) {
      return CarouselSlider(
          items: images.map<Widget>((element) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${element['image_name']}'),
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                                style: const TextStyle(
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
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                bool value =
                                    await ApiService().joinService(data.id);
                                if (await value == true) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Chat(
                                                serviceId: data.id,
                                                serviceTitle: data.taskTitle,
                                              )));

                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              child: !isLoading
                                  ? const Text(
                                      'PARTICIPATE',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ),
                          )
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
                    if (snapshot.data!.taskData!.length > 0)
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    //list'
                    if (snapshot.data!.taskData!.length > 0)
                      const Text(
                        'All Task',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    if (snapshot.data!.taskData!.length > 0)
                      Column(
                        children: List.generate(
                          snapshot.data!.taskData!.length,
                          (index) {
                            var value = snapshot.data!.taskData![index];
                            return ServiceTaskTile(
                              isUserId: user_id,
                              isUserOption: false,
                              isAssigneeId: 0,
                              taskStatus: value.assigneeId != null
                                  ? 'Ongoing'
                                  : 'Pending',
                              taskTitle: value.subtaskTitle.toString(),
                              taskAssignee: value.assignName ?? 'UNASSIGNED',
                              taskProgress: value.progress ?? 0,
                              serviceTaskTileAction: () {},
                            );
                          },
                        ),
                      ),

                    //end
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${data.taskDesc}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
