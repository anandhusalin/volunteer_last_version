import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
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
      body: ListView(
        children: [
          buildVolunteerSectionWidget(width, height),
          buildTaskSectionWidget(width, height),
        ],
      ),
    );
  }

  buildVolunteerSectionWidget(double width, double height) {
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
                children:
                    List.generate(5, (index) => buildVolunteerWidget(width))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPagerWidget(_pageController, volunteerPageIndex),
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

  buildTaskSectionWidget(double width, double height) {
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
            height: height * 0.35,
            width: width - 20,
            child: PageView(
              controller: _pageControllerTask,
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) => buildTaskListWidget(width)),
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

  buildTaskListWidget(double width) {
    return Container(
      child: Column(
        children: [
          buildTaskListItemWidget(width, true),
          buildTaskListItemWidget(width, true),
          buildTaskListItemWidget(width, true),
          buildTaskListItemWidget(width, false),
        ],
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

  buildTaskListItemWidget(width, isAssigned) {
    return Container(
      width: width * 0.90,
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Task Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 90),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isAssigned ? Colors.white : primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: primaryColor,
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: isAssigned ? assignedByWidget() : buildNotAssignedWidget(),
          ),
          if (isAssigned)
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: ProgressWidget(),
            ),
        ],
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

  buildNotAssignedWidget() {
    return const Text(
      'Volunteer',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  assignedByWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Assigned To',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Text(
          'Admin',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      ],
    );
  }

  buildVolunteerWidget(width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        4,
        (index) => Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVRH9yuYVHX-g9OWR8BUU-NLkLVooLCpjtvA&usqp=CAU',
              height: 50,
              width: 50,
            ),
            title: Text('Volunteer Name'),
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
}
