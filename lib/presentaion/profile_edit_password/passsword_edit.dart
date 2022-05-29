import 'package:bloc_volunteer_service/presentaion/view_profile/view_profile.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/inputfield.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../widgets/app_bar2_widget.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  savePasswordForm() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      var currentPasswordTXT = currentPassword.text;
      var newPasswordTXT = newPassword.text;
      var confirmPasswordTXT = confirmPassword.text;
      var response = await ApiService()
          .changePassword(currentPasswordTXT, confirmPasswordTXT);
      if (response == "Success") {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ViewProfile()));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error!"),
              content: Text('$response'),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      print('Form is invalid');
      setState(() {
        isLoading = false;
      });
    }
  }

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
          child: Form(
            key: _formKey,
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
                Visibility(
                    visible: isLoading,
                    child: const CircularProgressIndicator(
                      color: primaryColor,
                    )),
                Visibility(
                  visible: !isLoading,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                      onPressed: savePasswordForm,
                      child: const Text(
                        'SAVE',
                        style: TextStyle(
                            color: backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
