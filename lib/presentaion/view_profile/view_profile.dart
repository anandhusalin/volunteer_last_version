import 'dart:developer';
import 'dart:io';

import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/profile/profileModel.dart';
import 'package:bloc_volunteer_service/presentaion/edit_profile/screen_edit_profile.dart';
import 'package:bloc_volunteer_service/presentaion/loginpage/login_page.dart';
import 'package:bloc_volunteer_service/presentaion/profile_edit_password/passsword_edit.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../core/colors/colors.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  var outputFormat = DateFormat('MM-dd-yyyy');
  bool isLoading = false;
  File? imageFile;
  final picker = ImagePicker();
  final box = GetStorage();

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

  signOut() {
    box.erase();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "PROFILE"),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<ProfileModel>(
              future: ApiService().getProfile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var profileData = snapshot.data!.data;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Hello,",
                                  style: TextStyle(
                                      color: backgroundColor2,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${profileData!.name}",
                                  style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            buildProfileIcon(profileData),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 20),
                                ),
                                ConstSize.kwidth,
                                Text(
                                  "${profileData.name}",
                                  style: const TextStyle(
                                      color: backgroundColor2, fontSize: 20),
                                ),
                              ],
                            ),
                            ConstSize.kheight2,
                            ConstSize.kheight2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'User Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 20),
                                ),
                                ConstSize.kwidth,
                                Text(
                                  "${profileData.username}",
                                  style: const TextStyle(
                                      color: backgroundColor2, fontSize: 20),
                                ),
                              ],
                            ),
                            ConstSize.kheight2,
                            ConstSize.kheight2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 20),
                                ),
                                ConstSize.kwidth,
                                Text(
                                  "${profileData.email}",
                                  style: const TextStyle(
                                      color: backgroundColor2, fontSize: 20),
                                ),
                              ],
                            ),
                            ConstSize.kheight2,
                            ConstSize.kheight2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 20),
                                ),
                                ConstSize.kwidth,
                                Text(
                                  profileData.phone.toString(),
                                  style: const TextStyle(
                                      color: backgroundColor2, fontSize: 20),
                                ),
                              ],
                            ),
                            ConstSize.kheight2,
                            ConstSize.kheight2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Gender',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 20),
                                ),
                                ConstSize.kwidth,
                                Text(
                                  profileData.gender ?? "-",
                                  style: const TextStyle(
                                      color: backgroundColor2, fontSize: 20),
                                ),
                              ],
                            ),
                            ConstSize.kheight2,
                            ConstSize.kheight2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Date Of Birth',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 20),
                                ),
                                ConstSize.kwidth,
                                Text(
                                  outputFormat
                                      .format(profileData.dob as DateTime),
                                  style: const TextStyle(
                                      color: backgroundColor2, fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfile(
                                                          profileData:
                                                              profileData)));
                                        },
                                        icon: const Icon(Icons.edit)),
                                    const Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              builder: (ctxt) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Do you want to logout?'),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(false);
                                                      },
                                                      child: const Text('No'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: signOut,
                                                      child: const Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              },
                                              context: context);
                                        },
                                        icon:
                                            const Icon(Icons.logout_outlined)),
                                    const Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EditPassword()));
                                        },
                                        icon: const Icon(
                                            Icons.password_outlined)),
                                    const Text(
                                      "Edit Password",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

  Stack buildProfileIcon(profileData) {
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
                      '${profileData.imageName}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, ob, st) {
                        return Text(
                          profileData.name!.substring(0, 1).toUpperCase(),
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
        // Positioned(
        //   right: -5,
        //   bottom: -4,
        //   child: Center(
        //     child: Container(
        //       alignment: Alignment.center,
        //       child: IconButton(
        //         icon: const Icon(Icons.edit),
        //         onPressed: uploadProfileImage,
        //       ),
        //       height: 35,
        //       width: 35,
        //       decoration: BoxDecoration(
        //           color: Colors.red, borderRadius: BorderRadius.circular(50)),
        //     ),
        //   ),
        // ),
        // isLoading
        //     ? const Positioned(
        //         top: 30,
        //         child: SizedBox(
        //           child: CircularProgressIndicator(),
        //           height: 10.0,
        //           width: 10.0,
        //         ),
        //       )
        //     : SizedBox(),
      ],
    );
  }
}
