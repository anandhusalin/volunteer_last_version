import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/sign_up_model.dart';
import 'package:bloc_volunteer_service/presentaion/loginpage/login_page.dart';
import 'package:bloc_volunteer_service/services/signup_serices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final nameController = TextEditingController();
final userNameController = TextEditingController();
final phoneController = TextEditingController();
final genderController = TextEditingController();
final dobController = TextEditingController();
late SignupRequest signupRequest;
bool isLoading = false;
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

bool obserText = true;

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    signupRequest = SignupRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: const TextStyle(color: backgroundColor2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ConstSize.kheight,
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: backgroundColor2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ConstSize.kheight,
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: backgroundColor2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ConstSize.kheight,
                TextFormField(
                  obscureText: obserText,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: backgroundColor2),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obserText = !obserText;
                          });
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(
                          obserText == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: backgroundColor2,
                        ),
                      )),
                ),
                ConstSize.kheight,
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: const TextStyle(color: backgroundColor2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ConstSize.kheight,
                TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    hintStyle: const TextStyle(color: backgroundColor2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ConstSize.kheight,
                TextFormField(
                  controller: dobController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'DD/MM/YYYY',
                    hintStyle: const TextStyle(color: backgroundColor2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ConstSize.kheight2,
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Visibility(
                    visible: !isLoading,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (emailController.text.trim().isNotEmpty &&
                            passwordController.text.trim().isNotEmpty &&
                            phoneController.text.trim().isNotEmpty &&
                            userNameController.text.trim().isNotEmpty &&
                            nameController.text.trim().isNotEmpty &&
                            genderController.text.trim().isNotEmpty &&
                            dobController.text.trim().isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          signupRequest.dob = dobController.text.trim();
                          signupRequest.email = emailController.text.trim();
                          signupRequest.gender = genderController.text.trim();
                          signupRequest.password =
                              passwordController.text.trim();
                          signupRequest.username =
                              userNameController.text.trim();
                          signupRequest.name = nameController.text.trim();
                          signupRequest.phone = phoneController.text.trim();
                          SignUpService signUpService = SignUpService();
                          print("sign Up");
                          // print(signupRequest.name);
                          signUpService.signup(signupRequest).then((value) {
                            setState(() {
                              isLoading = false;
                            });
                            if (value.data != null) {
                              Get.to(() => const Login());
                            } else if (value.data == null) {
                              Get.snackbar('Error', value.message!);
                            } else if (value.message == null) {
                              Get.snackbar('Error', 'Something went wrong',
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: isLoading,
                    child: const CircularProgressIndicator(
                      color: primaryColor,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('I Have An Account'),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
