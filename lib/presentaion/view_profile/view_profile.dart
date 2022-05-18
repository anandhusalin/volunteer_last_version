import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/presentaion/edit_profile/screen_edit_profile.dart';
import 'package:bloc_volunteer_service/presentaion/profile_edit_password/passsword_edit.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "PROFILE"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Text(
                "Hello,",
                style: TextStyle(
                    color: backgroundColor2,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "  Anandhu  ",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  Positioned(
                    right: 130,
                    bottom: 4,
                    child: Center(
                      child: Container(
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 20),
                      ),
                      ConstSize.kwidth,
                      Text(
                        "Anandhu Salin",
                        style: TextStyle(color: backgroundColor2, fontSize: 20),
                      ),
                    ],
                  ),
                  ConstSize.kheight2,
                  ConstSize.kheight2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Profile Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 20),
                      ),
                      ConstSize.kwidth,
                      Text(
                        "Meluha",
                        style: TextStyle(color: backgroundColor2, fontSize: 20),
                      ),
                    ],
                  ),
                  ConstSize.kheight2,
                  ConstSize.kheight2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 20),
                      ),
                      ConstSize.kwidth,
                      Text(
                        "anandhu@gmail.com",
                        style: TextStyle(color: backgroundColor2, fontSize: 20),
                      ),
                    ],
                  ),
                  ConstSize.kheight2,
                  ConstSize.kheight2,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Phone',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 20),
                      ),
                      ConstSize.kwidth,
                      Text(
                        "9946673154",
                        style: TextStyle(color: backgroundColor2, fontSize: 20),
                      ),
                    ],
                  ),
                  ConstSize.kheight2,
                  ConstSize.kheight2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 20),
                      ),
                      ConstSize.kwidth,
                      Text(
                        "Anandhu@123",
                        style: TextStyle(color: backgroundColor2, fontSize: 20),
                      ),
                    ],
                  ),
                  ConstSize.kheight2,
                  ConstSize.kheight2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Gender',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 20),
                      ),
                      ConstSize.kwidth,
                      Text(
                        "Male",
                        style: TextStyle(color: backgroundColor2, fontSize: 20),
                      ),
                    ],
                  ),
                  ConstSize.kheight2,
                  ConstSize.kheight2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Date Of Birth',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 20),
                      ),
                      ConstSize.kwidth,
                      Text(
                        " 08-06-1997",
                        style: TextStyle(color: backgroundColor2, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //
                  //       borderRadius: BorderRadius.circular(20)
                  //   ),
                  //   height: 45,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         primary: Colors.orange),
                  //
                  //     onPressed: (){
                  //
                  //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>));
                  //
                  //     },
                  //
                  //
                  //     child: Text('LOGOUT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  //   ),
                  // ),

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
                                            const EditProfile()));
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
                              onPressed: () {},
                              icon: const Icon(Icons.logout_outlined)),
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
                              icon: const Icon(Icons.password_outlined)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
