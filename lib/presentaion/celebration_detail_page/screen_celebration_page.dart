import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/progressWidget.dart';

import 'package:flutter/material.dart';

import '../widgets/app_bar2_widget.dart';

class CelebrationSystemDetail extends StatefulWidget {
  final items;
  const CelebrationSystemDetail({Key? key, this.items}) : super(key: key);

  @override
  State<CelebrationSystemDetail> createState() =>
      _CelebrationSystemDetailState();
}

class _CelebrationSystemDetailState extends State<CelebrationSystemDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.items.taskTitle}',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'images/service2.jpg',
                  // height: height * 0.25,
                  width: width - 50,
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Service Completed',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            buildTaskCompletionWidget(width)
          ],
        ),
      ),
    );
  }

  buildTaskCompletionWidget(width) {
    return Container(
      // height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDateTimeWidget('Start', '22-Apr-2022 11:11:13 AM'),
          const SizedBox(height: 10),
          buildDateTimeWidget('End', '26-Apr-2022 12:12:00 AM'),
          const Divider(
            height: 7.0,
            thickness: 1.0,
          ),
          const SizedBox(height: 5.0),
          Text(
            widget.items.taskTitle,
            style: const TextStyle(
                color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          buildServiceDescription(),
          const SizedBox(height: 5),
          Row(
            children: const [
              Text(
                'Total Time to taken\t -',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                '1 Day',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Completed Task',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          Column(
            children: [
              buildTaskListWidget(width),
              buildTaskListWidget(width),
              buildTaskListWidget(width),
              buildTaskListWidget(width),
            ],
          ),
        ],
      ),
    );
  }

  Text buildServiceDescription() {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.fade,
      ),
    );
  }

  buildTaskListWidget(width) {
    return Container(
      width: width * 0.90,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Task Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  buildDateTimeWidget(title, dateTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryColor,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          dateTime,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  buildVolunteerWidget() {
    return Container(
      height: 65,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(5, (index) {
          double position = 0.0;
          return Positioned(
            left: index == 0 ? 0 : (position = position + 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.accents[index % Colors.accents.length],
              ),
            ),
          );
        }),
      ),
    );
  }

  buildTaskCompletionWidgetQ() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 10),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
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
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
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
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
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
  }
}
