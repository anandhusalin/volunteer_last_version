import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/model/serviceInformation/serviceInformationModel.dart';
import 'package:bloc_volunteer_service/presentaion/service_info/widget/serviceTaskTile.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/progressWidget.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';

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
  late int user_id;
  Future<ServiceInformationModel>? _serviceInformationModel;

  @override
  void initState() {
    super.initState();
    loadData();
    // _serviceInformationModel =
    //     ApiService().getInformationData(widget.serviceId);
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
  }

  @override
  void didChangeDependencies() {
    // _serviceInformationModel =
    //     ApiService().getInformationData(widget.serviceId);
    super.didChangeDependencies();
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
      appBar: const CustomAppBar(title: "Information"),
      body: StreamBuilder<ServiceInformationModel>(
          stream: ApiService().getInformationData(widget.serviceId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.data;
              return ListView(
                children: [
                  buildVolunteerSectionWidget(width, height, data!.volunteers),
                  buildTaskSectionWidget(width, height, data.task),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
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

  buildTaskSectionWidget(double width, double height, taskItem) {
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
            height: height * 0.75,
            width: width - 20,
            child: PageView(
              key: widget.key,
              controller: _pageControllerTask,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  taskItem.pageCount,
                  (index) =>
                      buildTaskListWidget(width, taskItem.taskList[index])),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPagerWidget(_pageControllerTask, taskPageIndex),
              ElevatedButton.icon(
                onPressed: () {},
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

  buildTaskListWidget(double width, taskData) {
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
                print('exit');
              } else {
                var res = await ApiService().assignTaskUser(value.taskId);
                if (res) {
                  loadData();
                  setState(() {});
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
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                /* Clear the search field */
              },
            ),
            hintText: '\t\tSearch...',
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
