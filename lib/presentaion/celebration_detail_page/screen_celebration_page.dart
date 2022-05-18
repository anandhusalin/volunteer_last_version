import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';

import 'package:flutter/material.dart';

import '../widgets/app_bar2_widget.dart';

class CelebrationSystemDetail extends StatefulWidget {
  const CelebrationSystemDetail({Key? key}) : super(key: key);

  @override
  State<CelebrationSystemDetail> createState() =>
      _CelebrationSystemDetailState();
}

class _CelebrationSystemDetailState extends State<CelebrationSystemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(
        title: "CELEBRATION SYSTEM",
        icon: Icons.arrow_back_ios,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'images/service2.jpg',
                  width: 300,
                  height: 300,
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Task Compleated',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 270,
                          child: Center(
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Start",
                                      style: TextStyle(color: Colors.pink),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(children: [
                                          const Icon(Icons.calendar_month),
                                          Column(
                                            children: [
                                              const Text("Monday"),
                                              Row(
                                                children: const [
                                                  Text("11"),
                                                  Text('April'),
                                                  Text("22")
                                                ],
                                              ),
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(children: [
                                          const Icon(Icons.lock_clock_sharp),
                                          Column(
                                            children: [
                                              Row(
                                                children: const [
                                                  Text("11"),
                                                  Text(':'),
                                                  Text('12'),
                                                  Text(":"),
                                                  Text("13")
                                                ],
                                              ),
                                              const Text("AM"),
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "End",
                                      style: TextStyle(color: Colors.pink),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(children: [
                                          const Icon(Icons.calendar_month),
                                          Column(
                                            children: [
                                              const Text("Monday"),
                                              Row(
                                                children: const [
                                                  Text("11"),
                                                  Text('April'),
                                                  Text("22")
                                                ],
                                              ),
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(children: [
                                          const Icon(Icons.lock_clock_sharp),
                                          Column(
                                            children: [
                                              Row(
                                                children: const [
                                                  Text("11"),
                                                  Text(':'),
                                                  Text('12'),
                                                  Text(":"),
                                                  Text("13")
                                                ],
                                              ),
                                              const Text("AM"),
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Description/Contents",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                ConstSize.kheight2,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
