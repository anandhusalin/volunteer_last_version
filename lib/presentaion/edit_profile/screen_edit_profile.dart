import 'dart:io';

import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/profile/profileModel.dart';
import 'package:bloc_volunteer_service/presentaion/view_profile/view_profile.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/inputfield.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../core/colors/colors.dart';
import '../widgets/app_bar2_widget.dart';

class EditProfile extends StatefulWidget {
  final profileData;
  const EditProfile({Key? key, required this.profileData}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var outputFormat = DateFormat('MM-dd-yyyy');
  // late Data profileData;
  final profileNameController = TextEditingController();
  final profilePhoneController = TextEditingController();
  final profileDOBController = TextEditingController();

  bool isLoading = false;
  bool isLoading1 = false;
  File? imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    profileNameController.text = widget.profileData.name;
    profilePhoneController.text = widget.profileData.phone.toString();
    profileDOBController.text =
        outputFormat.format(widget.profileData.dob as DateTime);
  }

  uploadProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);

      setState(() {
        isLoading == true;
      });
      String name = pickedFile.path.split('/').last;
      var multipartFile = await MultipartFile.fromFile(
        pickedFile.path,
        filename: name,
      );
      bool response = await ApiService().uploadProfileImage(multipartFile);
      if (response) {
        setState(() {
          isLoading == false;
        });
      } else {
        setState(() {
          isLoading == false;
        });
      }
    }
  }

  saveForm() async {
    if (_formKey.currentState!.validate()) {
      var name = profileNameController.text;
      var phone = profilePhoneController.text;
      var dob = profileDOBController.text;
      DateTime dob1 = DateFormat("dd-MM-yyyy").parse(dob);
      setState(() {
        isLoading1 = true;
      });
      bool response = await ApiService().updateProfile(name, phone, dob1);
      if (response) {
        setState(() {
          isLoading1 = false;
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ViewProfile()));
      } else {
        setState(() {
          isLoading1 = false;
        });
      }
    } else {
      print('Form is invalid');
      setState(() {
        isLoading1 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "EDIT PROFILE",
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
                  height: 50,
                ),
                //Profile icon
                buildProfileIcon(),
                buildCustomInputWidget(
                  title: 'Name',
                  controller: profileNameController,
                  keyBoardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                  hintText: 'Profile Name',
                ),
                ConstSize.kheight,
                buildCustomInputWidget(
                  title: 'Phone',
                  controller: profilePhoneController,
                  keyBoardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.length != 10) {
                      return 'Please enter the valid Phone';
                    }
                    return null;
                  },
                  hintText: 'Phone',
                ),
                ConstSize.kheight,
                buildCustomInputWidget(
                  title: 'DateOfBirth',
                  controller: profileDOBController,
                  keyBoardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the DateOfBirth';
                    }
                    if (value != null) {
                      try {
                        DateTime dob1 = DateFormat("dd-MM-yyyy").parse(value);
                        return null;
                      } catch (e) {
                        return 'Please enter the Correct formate';
                      }
                    }
                    return null;
                  },
                  hintText: 'DD-MM-YYYY',
                ),
                ConstSize.kheight,
                Visibility(
                    visible: isLoading1,
                    child: const CircularProgressIndicator(
                      color: primaryColor,
                    )),
                Visibility(
                  visible: !isLoading1,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                      onPressed: saveForm,
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
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCustomInputWidget(
      {title, controller, keyBoardType, validator, hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        TextFormField(
          keyboardType: keyBoardType,
          maxLines: null,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }

  Stack buildProfileIcon() {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 85,
          width: 85,
          // alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: imageFile == null
                  ? Image.network(
                      '${widget.profileData.imageName}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, ob, st) {
                        return Text(
                          widget.profileData.name!
                              .substring(0, 1)
                              .toUpperCase(),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        );
                      },
                    )
                  : Image.file(imageFile!, fit: BoxFit.cover)),
        ),
        Positioned(
          right: -5,
          bottom: -4,
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: uploadProfileImage,
              ),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
        isLoading
            ? const Positioned(
                top: 30,
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 10.0,
                  width: 10.0,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
