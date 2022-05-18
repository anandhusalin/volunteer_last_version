import 'package:bloc_volunteer_service/presentaion/widgets/inputfield.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../widgets/app_bar2_widget.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "EDIT PASSWORD",
        icon: Icons.arrow_back_ios,
        appbarLeadingButtonFunction: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Inputfield(
                  height: 50,
                  controller: currentPassword,
                  title: "CurrentPassword",
                  hint: "CurrertPassword"),
              const SizedBox(
                height: 20,
              ),
              Inputfield(
                  height: 50,
                  controller: newPassword,
                  title: "NewPassword",
                  hint: "NewPassword"),
              const SizedBox(
                height: 20,
              ),
              Inputfield(
                  height: 50,
                  controller: confirmPassword,
                  title: "ConfirmPassword",
                  hint: "ConfirmPassword"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {},
                  child: const Text(
                    'SAVE',
                    style: TextStyle(
                        color: backgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
