import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/login_model.dart';
import 'package:bloc_volunteer_service/presentaion/mainpage/scrren_main_page.dart';
import 'package:bloc_volunteer_service/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/colors/colors.dart';
import '../signup_page/screen_signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final emailController = TextEditingController(text: "anandhu@gmail.com");
final passwordController = TextEditingController(text: "12345678");
late LoginRequestModel loginModel;
final box = GetStorage();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

bool obsertext = true;

class _LoginState extends State<Login> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loginModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('images/1.jpg'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    ConstSize.kheight,
                    TextFormField(
                      autofillHints: const [AutofillHints.email],
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.black)),
                    ),
                    ConstSize.kheight,
                    TextFormField(
                      autofillHints: const [AutofillHints.password],
                      controller: passwordController,
                      obscureText: obsertext,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              setState(() {
                                obsertext = !obsertext;
                              });
                            },
                            child: Icon(
                              obsertext == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: const TextStyle(color: Colors.black)),
                    ),
                    ConstSize.kheight,
                    Row(
                      children: [
                        const Text(
                          "I don't have an account!",
                          style: TextStyle(fontSize: 16),
                        ),
                        ConstSize.kwidth,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SignUp());
                          },
                          child: const Text(
                            'SigunUp',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    ConstSize.kheight2,
                    ConstSize.kheight1,
                    Visibility(
                        visible: isLoading,
                        child: const CircularProgressIndicator(
                          color: primaryColor,
                        )),
                    Visibility(
                      visible: !isLoading,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: primaryColor),
                          onPressed: () async {
                            if (emailController.text.trim().isEmpty) {
                              Get.snackbar('Error', 'Email field is empty');
                            } else if (!emailController.text.trim().isEmail) {
                              Get.snackbar('Invalid', 'Enter a Valid Email');
                            } else if (passwordController.text.trim().isEmpty) {
                              Get.snackbar('Error', 'Password field is empty');
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              loginModel.email = emailController.text.trim();
                              loginModel.password =
                                  passwordController.text.trim();
                              LoginService loginService = LoginService();
                              loginService
                                  .login(loginModel)
                                  .then((value) async {
                                setState(() {
                                  isLoading = false;
                                });
                                if (value.data != null) {
                                  box.write('password',
                                      passwordController.text.trim());
                                  box.write('user', 'value');
                                  box.write('user_id', value.data!.id);
                                  box.write('Token', value.data!.apiToken);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenMainPage()));
                                } else {
                                  Get.snackbar(
                                      'Error', 'Invalid Email or Password');
                                }
                              });
                            }
                          },
                          child: const Text(
                            'LOGIN',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
