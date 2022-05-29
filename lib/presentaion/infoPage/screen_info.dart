import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(title: "Information"),
      body: ListView(
        children: [
          buildSectionHead(
            title: 'Volunteers',
            buttonAction: () {
              print('add volunteer');
            },
          ),
          //Vol.View
          Container(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 5.0,
              runSpacing: 5.0,
              children: [
                buildVolunteerWidget(width),
                buildVolunteerWidget(width),
                buildVolunteerWidget(width),
                buildVolunteerWidget(width),
              ],
            ),
          ),
          buildSectionHead(
            title: 'Tasks',
            buttonAction: () {
              print('add task');
            },
          ),
          //Task List
          Container(
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.grey.shade200),
            // margin: EdgeInsets.symmetric(horizontal: 5.0),
            // padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                buildTaskListItemWidget(width, true),
                buildTaskListItemWidget(width, true),
                buildTaskListItemWidget(width, true),
                buildTaskListItemWidget(width, false),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildTaskListItemWidget(width, isAssigned) {
    return Container(
      width: width * 0.90,
      margin: const EdgeInsets.symmetric(vertical: 5),
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
          if (isAssigned) buildProgress(),
          Container(
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
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVRH9yuYVHX-g9OWR8BUU-NLkLVooLCpjtvA&usqp=CAU',
              height: 50,
              width: 50,
            ),
          ),
          Text(
            'Name',
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      height: width * 0.30,
      width: width * 0.45,
    );
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

  buildProgress() {
    return Container(
      margin: EdgeInsets.only(left: 75),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            child: const CircularProgressIndicator(
              value: 8 / 10,
              valueColor: AlwaysStoppedAnimation(primaryColor),
              backgroundColor: Colors.grey,
            ),
          ),
          const Text(
            '10%',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              // color: ,
            ),
          )
        ],
      ),
    );
  }
}
