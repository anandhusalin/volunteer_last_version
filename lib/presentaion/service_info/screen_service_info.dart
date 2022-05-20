import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/chat.dart';
import 'package:flutter/material.dart';

import '../../model/service_info_model.dart';
import '../../services/service_info_service.dart';
import '../widgets/app_bar2_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final ServiceInfoService serviceInfoService = ServiceInfoService();
  bool isLoading = true;
  ServiceInfoModel? serviceInfoModel;

  List serviceInfoList = [];

  @override
  void initState() {
    super.initState();

    serviceInfoService.getServiceInfo().then((value) {
      setState(() {
        serviceInfoModel = value;
        isLoading = false;
        serviceInfoList = serviceInfoService.serviceList;
      });
      if (serviceInfoModel != null) {
        // ignore: avoid_print

        print(
            "//////////////////////////////////////////////////////////////////////////////////////");
        print(serviceInfoModel!.data![0].taskTitle.toString());
        print(
            "/////////////////////////////////////////////////////  END /////////////////////////////////");
      }
    });
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/Servicebnr.jpg'))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Puthiyakavu Area Cleaning',
                        // serviceInfoModel!.data![0].taskTitle.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
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
                                    builder: (context) => const Chat()));
                          },
                          child: const Text(
                            'VOLUNTEER',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                                serviceInfoModel != null
                                    ? serviceInfoModel!.data![0].estDuration
                                        .toString()
                                    : "hii joji",
                                style: const TextStyle(color: Colors.black),
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
              child: const Text(
                "Plant 200 trees in Puthiyakavu",
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
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/service4.jpg'))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(
                'hai',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
