import 'dart:developer';
import 'dart:io';

import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/services_model.dart';
import 'package:bloc_volunteer_service/presentaion/addtask/requirement_screen.dart';
import 'package:bloc_volunteer_service/services/service_services.dart';
// import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:dio/dio.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool isLoading = false;

  // List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  List allImages = [];
  late File imageFile;
  final picker = ImagePicker();

  Future<void> chooseImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {
        allImages.add(imageFile);
      });
    }
  }

  uploadData() async {
    setState(() {
      isLoading = true;
    });
    List<MultipartFile> newList = [];
    for (var img in allImages) {
      if (img != "") {
        String name = img.path.split('/').last;
        var multipartFile = await MultipartFile.fromFile(
          img.path,
          filename: name,
        );
        newList.add(multipartFile);
      }
    }
    FormData formData = FormData.fromMap({
      "task_title": solutionController.text,
      "task_desc": solutionDescriptionController.text,
      "volunteer_limit": int.parse(_controller.text),
      "issue_title": probleController.text,
      "issue_loc": locationController.text,
      "issue_desc": descripationController.text,
      "est_duration": int.parse(estimatedControler.text),
      "image[]": newList,
    });

    ServicesService servicesService = ServicesService();
    servicesService.addTask(formData).then((value) {
      setState(() {
        isLoading = false;
      });
      inspect(value);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RequirementsScreen(
              desc: solutionDescriptionController.text,
              estDur: estimatedControler.text,
              title: solutionController.text,
              volLimit: _controller.text,
              serviceId: value.service_id)));
    });
  }

  // Widget buildGridView() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     children: List.generate(images.length, (index) {
  //       Asset asset = images[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 300,
  //         height: 300,
  //       );
  //     }),
  //   );
  // }

  Widget buildImageSelector() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(6, (index) {
        return GestureDetector(
          onTap: chooseImage,
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: 2, color: Colors.grey.shade400)),
            child: (allImages.asMap().containsKey(index))
                ? Image.file(allImages[index], fit: BoxFit.fill)
                : const Icon(
                    Icons.photo_camera_outlined,
                    size: 40,
                    color: primaryColor,
                  ),
          ),
        );
      }),
    );
  }

  // Future<void> loadAssets() async {
  //   List<Asset> resultList = <Asset>[];
  //   String error = 'No Error Detected';

  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 6,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       cupertinoOptions: const CupertinoOptions(
  //         takePhotoIcon: "chat",
  //         doneButtonTitle: "Fatto",
  //       ),
  //       materialOptions: const MaterialOptions(
  //         actionBarColor: "#abcdef",
  //         actionBarTitle: "Example App",
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     error = e.toString();
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     images = resultList;
  //     _error = error;
  //   });
  // }

  /// ]

  /// IMAGE PICKER SINGLE WAY  THERE ARE 6 FUNCTIONS FOR THE EACH IMAGE PICKER  ALSO 6 VARIABLES [

  ///  ]

  /// REMOVE AND ADD VOLUNTEER BUTTON FUNCTION [

  bool values = true;
  bool _canShowButton = true;

  /// HIDING THE CURRENT VOLUNTEER LIMIT

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  /// SERIVE MODEL CLASS INITIALIZATION

  late ServiceModel serviceModel;

  ///  DECLARING THE TEXTEDDITING CONTROLLERS

  final estimatedControler = TextEditingController(text: "2");
  final probleController = TextEditingController(text: "problem");
  final locationController = TextEditingController(text: "location");
  final descripationController = TextEditingController(text: "description");
  final solutionController = TextEditingController(text: "solution");
  final solutionDescriptionController =
      TextEditingController(text: "solution Controller");

  // final estimatedControler2 = TextEditingController(text: "2");
  // final probleController2 = TextEditingController(text: "problem");
  // final locationController2 = TextEditingController(text: "location");
  // final descripationController2 = TextEditingController(text: "description");
  // final solutionController2 = TextEditingController(text: "solution");
  // final solutionDescriptionController2 =
  //     TextEditingController(text: "solution Controller");

  final _controller = TextEditingController(text: "1");

  @override
  void initState() {
    super.initState();
    serviceModel = ServiceModel();
    _controller.text = "1";

    const testVar = "initialButtonState";

    testVar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "ADD SERVICE",
        icon2: Icons.search,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          //reverse: true,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// SERVICE DETAILS PART

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const CommonSectionHeading(
                          text: "SERVICE DETAILS",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Service Title")),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(width: 2, color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              style: const TextStyle(),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              // onChanged:  (val) {
                              //   setState(() {
                              //     solutionController.text = val;
                              //   });
                              // },
                              controller: solutionController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        ConstSize.kheight,

                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Service Description")),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(width: 2, color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              style: const TextStyle(),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              // onChanged:  (val) {
                              //   setState(() {
                              //     solutionController.text = val;
                              //   });
                              // },
                              controller: solutionDescriptionController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        ConstSize.kheight,

                        // Inputfield(
                        //     contro: estimatedControler,
                        //     onc: (val) {
                        //       setState(() {
                        //         estimatedControler.text = val;
                        //       });
                        //     },
                        //     height: 50,
                        //     title: "Estimated Days",
                        //     hint: 'Estimated Days'),

                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Estimated Days")),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(width: 2, color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              style: const TextStyle(),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              // onChanged:  (val) {
                              //   setState(() {
                              //     solutionController.text = val;
                              //   });
                              // },
                              controller: estimatedControler,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        ConstSize.kheight,

                        //  n-image picker
                        buildImageSelector(),
                        //end  n-image picker

                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),

                /// ]

                const Divider(),

                /// VOLUNTEERS REQUIRED PART

                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const CommonSectionHeading(
                          text: "VOLUNTEERS REQUIRED",
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        ConstSize.kheight,

                        /// VISIBILY PART FOR VOLUNTEERS LIMIT [

                        Visibility(
                          visible: _canShowButton,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: const Center(
                                    child: Text(
                                      "Current Volunteer Limit",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, bottom: 10),
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 40),
                                      textAlign: TextAlign.center,
                                      readOnly: true,
                                      onTap: () {
                                        ///  BOTTOM SHEET

                                        showModalBottomSheet(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            25.0))),
                                            isScrollControlled: true,
                                            backgroundColor: Colors.white,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: SizedBox(
                                                  height: 220,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        height: 50,
                                                        width: 220,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Colors
                                                                    .grey)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextFormField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            onTap: () {
                                                              _controller.selection = TextSelection(
                                                                  baseOffset: 0,
                                                                  extentOffset:
                                                                      _controller
                                                                          .text
                                                                          .length);
                                                            },
                                                            enableIMEPersonalizedLearning:
                                                                true,
                                                            decoration: InputDecoration(
                                                                contentPadding: EdgeInsetsGeometry.lerp(
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            10),
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10),
                                                                    0),
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                            controller:
                                                                _controller,
                                                            keyboardType:
                                                                const TextInputType
                                                                        .numberWithOptions(
                                                                    decimal:
                                                                        false,
                                                                    signed:
                                                                        true),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              int currentValue =
                                                                  int.parse(
                                                                      _controller
                                                                          .text);

                                                              print(
                                                                  currentValue);
                                                              setState(() {
                                                                if (currentValue >
                                                                    1) {
                                                                  currentValue--;
                                                                  _controller
                                                                          .text =
                                                                      currentValue
                                                                          .toString();
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  '-',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          60,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              int currentValue =
                                                                  int.parse(
                                                                      _controller
                                                                          .text);
                                                              setState(() {
                                                                currentValue++;
                                                                _controller
                                                                        .text =
                                                                    currentValue
                                                                        .toString();
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  '+',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          50,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      ConstSize.kheight2,
                                                      ConstSize.kheight
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      controller: _controller,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ConstSize.kheight2,
                        !_canShowButton
                            ? Container(
                                height: 45,
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue),
                                  onPressed: () {
                                    hideWidget();
                                    _controller.text = "1";
                                  },
                                  child: const Text(
                                    "ADD VOLUNTEER LIMIT",
                                    style: TextStyle(
                                        color: backgroundColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              )
                            : Container(
                                height: 45,
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                  onPressed: () {
                                    hideWidget();
                                    _controller.text = "0";
                                  },
                                  child: const Text(
                                    "REMOVE VOLUNTEER LIMIT",
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
                ConstSize.kheight2,
                ConstSize.kheight2,

                /// ADD TASK BUTTON
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
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () async {
                        if (solutionController.text.isNotEmpty &&
                            solutionDescriptionController.text.isNotEmpty &&
                            int.parse(_controller.text) > 0 &&
                            estimatedControler.text.isNotEmpty &&
                            probleController.text.isNotEmpty &&
                            locationController.text.isNotEmpty &&
                            descripationController.text.isNotEmpty) {
                          uploadData();
                        } else {
                          print("fill form %%%%%%%%%%%%%%%%%%%%%%%%%");
                          print(solutionController.text + " aminaa");
                          print(int.parse(_controller.text));
                          print(solutionDescriptionController.text + " amifna");
                        }
                      },
                      child: const Text(
                        'SUBMIT',
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

/// ELEVATED BUTTON CUSTOMIZED

class CustomElevatedButtonWidget extends StatelessWidget {
  final Function onClickFunction;
  final String text;
  const CustomElevatedButtonWidget({
    required this.text,
    required this.onClickFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: () {
          onClickFunction;
          print("Called onClickFunction");
        },
        child: Text(
          text,
          style: const TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }
}

/// COMMON HEADING LIKE VOLUNTEERS REQUIRD, SERVICE DETAILS etc

class CommonSectionHeading extends StatelessWidget {
  final String text;
  const CommonSectionHeading({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text.toUpperCase(),
            style: const TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

/// COMMON TEXTFORM FIELDS

class Inputfield extends StatelessWidget {
  Inputfield({
    Key? key,
    required this.height,
    required this.contro,
    required this.onc,
    required this.title,
    required this.hint,
  }) : super(key: key);
  final double height;
  final Function(String val) onc;
  final String title;
  final String hint;
  TextEditingController contro;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 2, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              style: const TextStyle(),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: onc,
              controller: contro,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
