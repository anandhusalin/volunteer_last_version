import 'package:bloc_volunteer_service/presentaion/mainpage/scrren_main_page.dart';

import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../service_info/screen_service_info.dart';

class DrowerPage extends StatefulWidget {
  const DrowerPage({Key? key}) : super(key: key);

  @override
  State<DrowerPage> createState() => _DrowerPageState();
}

class _DrowerPageState extends State<DrowerPage> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(10))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6.1,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/sidebartop.png'))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 0,
                        ),
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: Image.asset('images/logo.png'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100)),
                          height: 35,
                          width: 35,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        )
                      ],
                    )
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   child: Column(
              //     children: [
              //
              //       Container(
              //         width: MediaQuery.of(context).size.width,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.grey),
              //             color: Colors.white,
              //           borderRadius: BorderRadius.circular(10)
              //         ),
              //         child: Column(
              //           children: [
              //             Container(
              //               height: 25,
              //               width: MediaQuery.of(context).size.width,
              //               decoration: BoxDecoration(
              //                 color: Colors.black,
              //                 borderRadius: BorderRadius.circular(5),
              //
              //
              //               ),
              //               child: Center(
              //                 child: Text('Reqirements',style: TextStyle(
              //                     color: Colors.white
              //                 ),),
              //               ),
              //             ),
              //             Container(
              //               margin: EdgeInsets.symmetric(horizontal: 10),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //
              //                 children: [
              //                   SizedBox(
              //                     height: 8,
              //                   ),
              //
              //                   Align(
              //
              //                     child: Text('Bill Details',style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15
              //                     ),),
              //                     alignment: Alignment.topLeft,
              //                   ),
              //                  const  SizedBox(
              //                     height: 8,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text('price',style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 13
              //                       ),),
              //                       Text('AED 2050',style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 13
              //                       ),)
              //                     ],
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text('Discount',style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 13
              //                       ),),
              //                       Text('-AED 10',style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 13
              //                       ),)
              //                     ],
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text('VAT 5%',style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 13
              //                       ),),
              //                       Text('AED 5.60',style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 13
              //                       ),)
              //                     ],
              //                   ),
              //                   SizedBox(
              //                     height: 5,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text('Total',style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 15
              //                       ),),
              //                       Text('AED 4085.6',style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 15
              //                       ),)
              //                     ],
              //                   ),
              //                   SizedBox(
              //                     height: 1,
              //                   )
              //
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //
              //
              //
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Container(
              //         width: MediaQuery.of(context).size.width,
              //         height: 100,
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.grey),
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(10)
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Container(
              //               height: 25,
              //               width: MediaQuery.of(context).size.width,
              //               decoration: BoxDecoration(
              //                 color: Colors.black,
              //                 borderRadius: BorderRadius.circular(5),
              //
              //
              //               ),
              //               child: Center(
              //                 child: Text('Member Details',style: TextStyle(
              //                     color: Colors.white
              //                 ),),
              //               ),
              //             ),
              //
              //             Row(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 8),
              //                   child: Container(
              //                      width: 20,
              //                     height: 20,
              //                     decoration: BoxDecoration(
              //                       color: Colors.red,
              //                       borderRadius: BorderRadius.circular(50)
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //                 ),
              //                 Text('Nithin',style: TextStyle(
              //                   fontWeight: FontWeight.bold
              //                 ),)
              //               ],
              //             ),
              //
              //             Row(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 8),
              //                   child: Container(
              //                     width: 20,
              //                     height: 20,
              //                     decoration: BoxDecoration(
              //                         color: Colors.red,
              //                         borderRadius: BorderRadius.circular(50)
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //                 ),
              //                 Text('Rejeena',style: TextStyle(
              //                     fontWeight: FontWeight.bold
              //                 ),)
              //               ],
              //             ),
              //
              //             Row(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 8),
              //                   child: Container(
              //                     width: 20,
              //                     height: 20,
              //                     decoration: BoxDecoration(
              //                         color: Colors.red,
              //                         borderRadius: BorderRadius.circular(50)
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //                 ),
              //                 Text('Bhama',style: TextStyle(
              //                     fontWeight: FontWeight.bold
              //                 ),)
              //               ],
              //             ),
              //
              //
              //           ],
              //         ),
              //
              //
              //
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Container(
              //         width: MediaQuery.of(context).size.width,
              //         height: 130,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             border: Border.all(color: Colors.grey),
              //             borderRadius: BorderRadius.circular(10)
              //
              //         ),
              //         child: Column(
              //           children: [
              //             Container(
              //               height: 25,
              //               width: MediaQuery.of(context).size.width,
              //               decoration: BoxDecoration(
              //                 color: Colors.black,
              //                 borderRadius: BorderRadius.circular(5),
              //
              //
              //               ),
              //               child: Center(
              //                 child: Text('Requirements',style: TextStyle(
              //                   color: Colors.white
              //                 ),),
              //               ),
              //             ),
              //
              //             Row(
              //
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(10.0),
              //                   child: SizedBox(
              //                     height: 10,
              //                     width: 10,
              //                     child: Checkbox(
              //
              //                         value: this.isChecked,
              //                         onChanged: (bool? value){
              //                           setState(() {
              //                             isChecked= value!;
              //
              //                           });
              //
              //                     }),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //
              //                 ),
              //                 Text('Flat',style: TextStyle(
              //                   fontWeight: FontWeight.bold
              //                 ),)
              //               ],
              //             ),
              //             Row(
              //
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(10.0),
              //                   child: SizedBox(
              //                     height: 10,
              //                     width: 10,
              //                     child: Checkbox(
              //
              //                         value: this.isChecked2,
              //                         onChanged: (bool? value){
              //                           setState(() {
              //                             isChecked2= value!;
              //
              //                           });
              //
              //                         }),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //
              //                 ),
              //                 Text('Appartment',style: TextStyle(
              //                     fontWeight: FontWeight.bold
              //                 ),)
              //               ],
              //             ),
              //             Row(
              //
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(10.0),
              //                   child: SizedBox(
              //                     height: 10,
              //                     width: 10,
              //                     child: Checkbox(
              //
              //                         value: this.isChecked3,
              //                         onChanged: (bool? value){
              //                           setState(() {
              //                             isChecked3= value!;
              //
              //                           });
              //
              //                         }),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //
              //                 ),
              //                 Text('Villa',style: TextStyle(
              //                     fontWeight: FontWeight.bold
              //                 ),)
              //               ],
              //             ),
              //
              //
              //           ],
              //         ),
              //
              //
              //
              //       ),
              //
              //
              //
              //     ],
              //   ),
              // ),

              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Align(
                        child: Text(
                          'Name One',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        child: Text(
                          'Assigned Task',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Subtitle one'),
                          Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Subtitle one'),
                          Checkbox(
                              value: isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2 = value!;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Subtitle one'),
                          Checkbox(
                              value: isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked3 = value!;
                                });
                              })
                        ],
                      ),
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.height / 6.1,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/sidebarbtm.png'))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScreenMainPage()));
                            },
                            icon: const Icon(
                              Icons.home,
                              size: 30,
                              color: primaryColor,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TaskPage()));
                            },
                            icon: const Icon(
                              Icons.category,
                              size: 30,
                              color: primaryColor,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
