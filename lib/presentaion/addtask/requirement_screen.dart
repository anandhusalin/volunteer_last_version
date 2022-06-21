import 'dart:convert';
import 'dart:developer';

import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/addTask/addTaskModel.dart';
import 'package:bloc_volunteer_service/presentaion/infoPage/screen_info.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/inputfield.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RequirementsScreen extends StatefulWidget {
  final title;
  final desc;
  final estDur;
  final volLimit;
  final serviceId;
  RequirementsScreen(
      {Key? key,
      this.title,
      this.desc,
      this.estDur,
      this.volLimit,
      required this.serviceId})
      : super(key: key);

  @override
  State<RequirementsScreen> createState() => _RequirementsScreenState();
}

class _RequirementsScreenState extends State<RequirementsScreen> {
  final List<RequirementInputTile> _requirementWidgets =
      <RequirementInputTile>[];
  List<String> listOfTextEntries = [];

  final taskController = TextEditingController();
  final taskdecController = TextEditingController();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  void showTextFieldEntries() async {
    final _requirementData = _requirementWidgets
        .map(
          (i) => TaskRequirement(
              requirement: i.controller.text.trim(), quantity: 0, qtyUnit: 0),
        )
        .toList();
    AddTaskModel taskData = AddTaskModel(
        serviceId: widget.serviceId.toString(),
        subtaskTitle: taskController.text.trim(),
        subtaskDesc: taskdecController.text.trim(),
        taskRequirement: _requirementData);
    if (taskController.text.isNotEmpty && taskdecController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      bool respons = await ApiService().addServiceTask(taskData.toJson());
      if (respons) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoScreen(
                      serviceId: widget.serviceId,
                    )));
      }
      setState(() {
        isLoading = false;
      });
    } else {
      Get.snackbar('Error', 'Fill all fields!');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(title: "ADD TASK"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              buildAddTaskSection(taskController, taskdecController),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(5.0),
                width: double.infinity,
                decoration: customDecoration,
                child: Column(
                  children: [
                    const Text(
                      'TASK REQUIREMENTS',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    buildRequirementTiles(width),
                    ElevatedButton(
                      onPressed: () {
                        _requirementWidgets.add(
                          RequirementInputTile(
                            fieldName: 'Enter the requirement',
                            controller: returnController(
                                "requirementTextInputController ${_requirementWidgets.length + 1}"),
                          ),
                        );
                        setState(() {});
                      },
                      child: const Text('ADD REQUIREMENT'),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              buildBottomActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration customDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.shade200,
  );
  TextEditingController returnController(String controllerName) {
    final controllerName = TextEditingController();
    return controllerName;
  }

  buildAddTaskSection(taskController, taskdecController) {
    return Container(
      decoration: customDecoration,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text('TASK DETAILS',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600)),

            // costomized input field
            Inputfield(
                height: 50,
                controller: taskController,
                title: 'Task title',
                hint: 'task title'),
            ConstSize.kheight2,
            Inputfield(
                height: 50,
                controller: taskdecController,
                title: "Task Description",
                hint: 'Task Dec'),
            ConstSize.kheight,
          ],
        ),
      ),
    );
  }

  buildRequirementTiles(width) {
    return Column(
      children: List.generate(_requirementWidgets.length, (i) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width * 0.75,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: _requirementWidgets[i],
              ),
              // i == _requirementWidgets.length - 1
              _addRemoveButton(false, i),
            ],
          ),
        );
      }),
    );
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          _requirementWidgets.add(
            RequirementInputTile(
              fieldName: 'Enter the requirement',
              controller: returnController(
                  "requirementTextInputController ${index + 1}"),
            ),
          );
        } else {
          _requirementWidgets.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  buildBottomActionButton() {
    return Row(
      children: [
        buildActionButton(isCancel: true, onActionPress: () {}),
        const SizedBox(
          width: 10,
        ),
        Visibility(
          visible: isLoading,
          child: Expanded(
            flex: 1,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 45,
              child: Center(
                child: const CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isLoading,
          child: buildActionButton(
              isCancel: false,
              onActionPress: () {
                showTextFieldEntries();
              }),
        ),
      ],
    );
  }

  Expanded buildActionButton(
      {bool isCancel = true, void Function()? onActionPress}) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: isCancel ? Colors.red : primaryColor),
          onPressed: onActionPress,
          child: Text(
            isCancel ? 'CANCEL' : 'SUBMIT',
            style: const TextStyle(
                color: backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class RequirementInputTile extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;

  const RequirementInputTile(
      {Key? key, this.fieldName = '', required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        border: InputBorder.none,
        filled: true,
        // labelText: fieldName,
      ),
      maxLines: 1,
    );
  }
}
