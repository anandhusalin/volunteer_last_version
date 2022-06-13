import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/progressWidget.dart';
import 'package:flutter/material.dart';

class ServiceTaskTile extends StatelessWidget {
  final isUserId;
  final bool isUserOption;
  final String taskStatus;
  final String taskTitle;
  final String taskAssignee;
  final int taskProgress;
  final isAssigneeId;
  final void Function() serviceTaskTileAction;
  const ServiceTaskTile({
    Key? key,
    required this.isUserId,
    required this.taskStatus,
    required this.taskTitle,
    required this.taskAssignee,
    required this.taskProgress,
    required this.isAssigneeId,
    required this.isUserOption,
    required this.serviceTaskTileAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      // height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\t\t\ $taskStatus',
            // isAssignee ? '\t\t\tOngoing' : '\t\t\tPending',
            style: const TextStyle(
              fontSize: 20,
              // color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            height: 5,
            thickness: 1.0,
            indent: 6.0,
            color: Colors.grey,
            endIndent: 20,
          ),
          Row(
            children: [
              Container(
                height: 50,
                child: const VerticalDivider(
                  thickness: 1.0,
                  indent: 5.0,
                  width: 5,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    taskTitle,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 17,
                      // color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              ProgressWidget(progress: taskProgress)
            ],
          ),
          buildTaskUserTile()
        ],
      ),
    );
  }

  buildTaskUserTile() {
    return Row(
      children: [
        const Icon(
          Icons.person_outline,
          color: primaryColor,
          size: 25,
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            taskAssignee,
            style: const TextStyle(
              fontSize: 16,
              // color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (isUserId == isAssigneeId || isAssigneeId == null)
          Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: isUserOption ? Colors.red : primaryColor,
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: IconButton(
              onPressed: serviceTaskTileAction,
              icon: isUserOption
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20,
                    )
                  : Image.asset('images/support.png'),
            ),
          ),
      ],
    );
  }
}
