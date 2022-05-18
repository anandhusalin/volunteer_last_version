import 'dart:io';

import 'package:bloc_volunteer_service/presentaion/widgets/app_bar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_volunteer_service/core/colors/colors.dart';
import 'package:bloc_volunteer_service/core/constant.dart';
import 'package:bloc_volunteer_service/model/services_model.dart';
import 'package:bloc_volunteer_service/presentaion/addtask/requirement_screen.dart';
import 'package:bloc_volunteer_service/services/service_services.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  /// MULTIPLE IMAGE PICKING NOT COMPLETED  (FUNCTION AND LISTS)  [

  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  /// ]

  /// IMAGE PICKER SINGLE WAY  THERE ARE 6 FUNCTIONS FOR THE EACH IMAGE PICKER  ALSO 6 VARIABLES [

  File? _images1;
  File? _images2;
  File? _images3;
  File? _images4;
  File? _images5;
  File? _images6;

  final _picker1 = ImagePicker();
  final _picker2 = ImagePicker();
  final _picker3 = ImagePicker();
  final _picker4 = ImagePicker();
  final _picker5 = ImagePicker();
  final _picker6 = ImagePicker();
  // Implementing the image picker

  /// FUNCTION FOR IMAGE PICKER

  Future<void> _openImagePicker1() async {
    final XFile? pickedImage1 = await _picker1.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage1 != null) {
      setState(() {
        _images1 = File(pickedImage1.path);
      });
    }
  }

  Future<void> _openImagePicker2() async {
    final XFile? pickedImage2 =
        await _picker2.pickImage(source: ImageSource.gallery);
    if (pickedImage2 != null) {
      setState(() {
        _images2 = File(pickedImage2.path);
      });
    }
  }

  Future<void> _openImagePicker3() async {
    final XFile? pickedImage3 =
        await _picker3.pickImage(source: ImageSource.gallery);
    if (pickedImage3 != null) {
      setState(() {
        _images3 = File(pickedImage3.path);
      });
    }
  }

  Future<void> _openImagePicker4() async {
    final XFile? pickedImage4 =
        await _picker4.pickImage(source: ImageSource.gallery);
    if (pickedImage4 != null) {
      setState(() {
        _images4 = File(pickedImage4.path);
      });
    }
  }

  Future<void> _openImagePicker6() async {
    final XFile? pickedImage6 =
        await _picker6.pickImage(source: ImageSource.gallery);
    if (pickedImage6 != null) {
      setState(() {
        _images6 = File(pickedImage6.path);
      });
    }
  }

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
        title: "SERVICE ADDING",
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     // Text(
                //     //   'ISSUE',
                //     //   style: TextStyle(
                //     //       color: Colors.blue,
                //     //       fontSize: 25,
                //     //       fontWeight: FontWeight.w600),
                //     // )
                //   ],
                // ),
                // ConstSize.kheight,
                // Inputfield(
                //   contro: probleController2,
                //   onc: (val) {
                //     setState(() {
                //       probleController.text = val;
                //     });
                //   },
                //   height: 60,
                //   title: 'Problem',
                //   hint: 'Problem',
                // ),
                // ConstSize.kheight,
                // Inputfield(
                //   contro: locationController2,
                //   onc: (val) {
                //     setState(() {
                //       locationController.text = val;
                //     });
                //   },
                //   height: 60,
                //   title: 'Location',
                //   hint: 'Location',
                // ),
                // ConstSize.kheight,
                // Inputfield(
                //   contro: descripationController2,
                //   onc: (val) {
                //     setState(() {
                //       descripationController.text = val;
                //     });
                //   },
                //   height: 90,
                //   title: 'Descripation',
                //   hint: 'Descripation',
                // ),
                // ConstSize.kheight,

                // const Divider(),
                // const SizedBox(
                //   height: 10,
                // ),

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
                        // Inputfield(
                        //     contro: solutionController,
                        //     onc: (val) {
                        //       setState(() {
                        //         solutionController.text = val;
                        //       });
                        //     },
                        //     height: 50,
                        //     title: "Service Title",
                        //     hint: 'Solution'),
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

                        /// MULTIPLE IMAGE PICKER PART NOT COMPLETED [

                        // images == null
                        //     ? GridView.builder(
                        //         physics: const NeverScrollableScrollPhysics(),
                        //         shrinkWrap: true,
                        //         itemCount: 6,

                        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                        //                 crossAxisCount: 3,
                        //                 crossAxisSpacing: 6.0,
                        //                 mainAxisSpacing: 6.0),

                        //         itemBuilder: (BuildContext context, int index) {

                        //           return Container(

                        //             height: 100,
                        //             width: 110,
                        //             decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(6),
                        //                 border: Border.all(
                        //                     width: 2,
                        //                     color: Colors.grey.shade400)),
                        //             child: const Center(
                        //               child: Icon(
                        //                 Icons.photo_camera_outlined,
                        //                 size: 40,
                        //                 color: primaryColor,
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //       )
                        //     : buildGridView(),

                        /// ]

                        /// SINGLE IMAGE PICKER [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade400)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: _openImagePicker1,
                                  child: _images1 != null
                                      ? Image.file(_images1!, fit: BoxFit.cover)
                                      : const Icon(
                                          Icons.photo_camera_outlined,
                                          size: 40,
                                          color: primaryColor,
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade400)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: _openImagePicker2,
                                  child: _images2 != null
                                      ? Image.file(_images2!, fit: BoxFit.cover)
                                      : const Icon(
                                          Icons.photo_camera_outlined,
                                          size: 40,
                                          color: primaryColor,
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade400)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: _openImagePicker3,
                                  child: _images3 != null
                                      ? Image.file(_images3!, fit: BoxFit.cover)
                                      : const Icon(
                                          Icons.photo_camera_outlined,
                                          size: 40,
                                          color: primaryColor,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade400)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: _openImagePicker3,
                                  child: _images3 != null
                                      ? Image.file(_images3!, fit: BoxFit.cover)
                                      : const Icon(
                                          Icons.photo_camera_outlined,
                                          size: 40,
                                          color: primaryColor,
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade400)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: _openImagePicker4,
                                  child: _images4 != null
                                      ? Image.file(_images4!, fit: BoxFit.cover)
                                      : const Icon(
                                          Icons.photo_camera_outlined,
                                          size: 40,
                                          color: primaryColor,
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade400)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: _openImagePicker6,
                                  child: _images6 != null
                                      ? Image.file(
                                          _images6!,
                                          fit: BoxFit.contain,
                                        )
                                      : const Icon(
                                          Icons.photo_camera_outlined,
                                          size: 40,
                                          color: primaryColor,
                                        ),
                                ),
                              ),
                            ),
                          ],
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

                Container(
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
                        setState(() {
                          serviceModel.issueDesc = descripationController.text;
                          serviceModel.issueLoc = locationController.text;
                          serviceModel.issueTitle = probleController.text;
                          serviceModel.estimatedTime =
                              int.parse(estimatedControler.text);
                          serviceModel.taskDesc =
                              solutionDescriptionController.text;
                          serviceModel.taskTitle = solutionController.text;
                          serviceModel.volunteerLimit =
                              int.parse(_controller.text);
                        });
                        print("##############");
                        print(solutionController.text + " amina");

                        ServicesService servicesService = ServicesService();
                        servicesService.addForm(serviceModel).then((value) {
                          print("***** Message ******");
                          print(value.message);
                          Get.to(() => RequirementsScreen(
                                desc: solutionDescriptionController.text,
                                estDur: estimatedControler.text,
                                title: solutionController.text,
                                volLimit: _controller.text,
                              ));
                        });
                      } else {
                        print("fill form %%%%%%%%%%%%%%%%%%%%%%%%%");
                        print(solutionController.text + " aminaa");
                        print(int.parse(_controller.text));
                        print(solutionDescriptionController.text + " amifna");
                      }
                    },
                    child: const Text(
                      'ADD TASK',
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
