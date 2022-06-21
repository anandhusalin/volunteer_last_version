import 'dart:developer';

import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/model/serviceInformation/serviceInformationModel.dart';
import 'package:bloc_volunteer_service/presentaion/addtask/requirement_screen.dart';
import 'package:bloc_volunteer_service/presentaion/service_info/widget/serviceTaskTile.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/progressWidget.dart';
import 'package:bloc_volunteer_service/provider/infomation/InformationProvider.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  final serviceId;
  InfoScreen({Key? key, required this.serviceId}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  PageController _pageControllerTask = PageController(
    initialPage: 0,
  );
  int volunteerPageIndex = 1;
  int taskPageIndex = 1;
  final box = GetStorage();
  late int user_id = 0;
  Future<ServiceInformationModel>? _serviceInformationModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loadData();
    _pageController.addListener(() {
      setState(() {
        volunteerPageIndex = _pageController.page!.toInt() + 1;
      });
    });
    _pageControllerTask.addListener(() {
      setState(() {
        taskPageIndex = _pageControllerTask.page!.toInt() + 1;
      });
    });
  }

  loadData() async {
    user_id = await box.read('user_id');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InformationProvider>(context, listen: false)
          .getInfo(widget.serviceId);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageControllerTask.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: const CustomAppBar(title: "Information"),
      body: Consumer<InformationProvider>(builder: (context, value, child) {
        return !value.loading
            ? ListView(
                children: [
                  if (value.infoList != null)
                    buildVolunteerSectionWidget(
                        width, height, value.infoList!.data!.volunteers),
                  const Divider(
                    thickness: 1,
                    height: 5,
                    color: Colors.grey,
                    // indent: 5,
                    // endIndent: 5,
                  ),
                  if (value.infoList != null)
                    buildTaskSectionWidget(
                        width, height, value.infoList!.data!.task, value),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }

  buildVolunteerSectionWidget(double width, double height, data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Volunteers',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              buildSearchWidget(width),
            ],
          ),
          Divider(),
          Container(
            height: height * 0.32,
            width: width - 20,
            child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    data.pageCount,
                    (index) => buildVolunteerWidget(
                        width, data!.voluteerList[index]))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPagerWidget(_pageController, volunteerPageIndex),
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.add,
              //     size: 14,
              //   ),
              //   label: const Text('Add'),
              //   style: ElevatedButton.styleFrom(
              //     textStyle: const TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }

  buildTaskSectionWidget(double width, double height, taskItem, providerVal) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Task',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              buildSearchWidget(width),
            ],
          ),
          Divider(),
          Container(
            height: height * 0.70,
            width: width - 20,
            child: PageView(
              key: widget.key,
              controller: _pageControllerTask,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  taskItem.pageCount,
                  (index) => buildTaskListWidget(
                      width, taskItem.taskList[index], providerVal)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPagerWidget(_pageControllerTask, taskPageIndex),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          RequirementsScreen(serviceId: widget.serviceId)));
                },
                icon: const Icon(
                  Icons.add,
                  size: 14,
                ),
                label: const Text('Add'),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildTaskListWidget(double width, taskData, providerVal) {
    return Column(
      children: List<Widget>.generate(
        taskData.length,
        (index) {
          var value = taskData[index];
          return ServiceTaskTile(
            isUserOption: value.assigneeId != null
                ? value.assigneeId == user_id
                    ? true
                    : false
                : false,
            isUserId: user_id,
            isAssigneeId: value.assigneeId,
            taskStatus: value.assigneeId != null ? 'Ongoing' : 'Pending',
            taskTitle: value.subtaskTitle,
            taskAssignee: value.assignName ?? 'UNASSIGNED',
            taskProgress: value.progress ?? 0,
            serviceTaskTileAction: () async {
              if (user_id == value.assigneeId) {
                var res = await providerVal.removeTaskUser(value.taskId);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Container(
                    height: 50,
                    width: width,
                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Removing....',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ));
                if (res) {
                  loadData();
                }
              } else {
                var res = await providerVal.assignTaskUser(value.taskId);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: primaryColor,
                  content: Container(
                    height: 50,
                    width: width,
                    color: primaryColor,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Assigning....',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ));
                if (res) {
                  loadData();
                }
              }
            },
          );
        },
      ),
    );
  }

  buildSearchWidget(double width) {
    return Container(
      height: 43,
      width: width * 0.65,
      decoration: BoxDecoration(
        // color: primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                /* Clear the search field */
              },
            ),
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  buildPagerWidget(pageController, index) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      height: 25,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              pageController.animateToPage(pageController.page!.toInt() - 1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
            ),
          ),
          const VerticalDivider(
            color: Colors.grey,
          ),
          Text('$index'),
          const VerticalDivider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(pageController.page!.toInt() + 1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  buildVolunteerWidget(width, item) {
    return Wrap(
      children: List.generate(
        item.length,
        (index) => Container(
          width: width,
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 55,
                width: 50,
                child: ClipRRect(
                  child: Image.network(
                    '${item[index].imageName}',
                    errorBuilder: ((context, error, stackTrace) =>
                        buildImageHolder()),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                item[index].name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );

    // Container(
    //   decoration: BoxDecoration(
    //       border: Border.all(color: Colors.grey),
    //       borderRadius: BorderRadius.circular(10)),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(25),
    //         child: Image.network(
    //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVRH9yuYVHX-g9OWR8BUU-NLkLVooLCpjtvA&usqp=CAU',
    //           height: 50,
    //           width: 50,
    //         ),
    //       ),
    //       Text(
    //         'Name',
    //         style: const TextStyle(color: Colors.black),
    //       ),
    //     ],
    //   ),
    //   height: width * 0.30,
    //   width: width * 0.45,
    // );
  }

  buildSectionHead({title, buttonAction}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            onPressed: buttonAction,
            icon: const Icon(
              Icons.add,
              size: 14,
            ),
            label: const Text('Add'),
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildImageHolder() {
    return Image.network(
      'https://thumbs.dreamstime.com/b/no-thumbnail-images-placeholder-forums-blogs-websites-148010338.jpg',
      fit: BoxFit.fill,
    );
  }
}
