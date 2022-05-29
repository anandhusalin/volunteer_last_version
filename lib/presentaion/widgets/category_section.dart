// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/colors/colors.dart';
import '../../model/category_model.dart';
import '../../model/service_bycategory_model.dart';
import '../../services/category_service_list_service.dart';
import '../../services/get_categoey_services.dart';
import '../nottifications/text_input.dart';
import '../service_info/screen_service_info.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final CategoryServiceListService categoryServiceList =
      CategoryServiceListService();
  final GetServiceByCategoryServices categoryService =
      GetServiceByCategoryServices();
  late Future<GetServiceByCategoryModel> categoryList;
  late Future<CategoryServiceListModel> categoryServiceListModel;

  GetServiceByCategoryModel? service;
  List categories = [];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    categoryList = categoryService.getDataCategories();
  }

  int position = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetServiceByCategoryModel>(
        future: categoryList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.data;
            currentIndex == 0 ? (position = data![0].id!) : 0;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data!.length,
                        itemBuilder: (_, index) {
                          var item = data[index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                    position = item.id!;
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentIndex == index
                                        ? primaryColor
                                        : backgroundColor,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Image.network(
                                          '${item.imageName}',
                                          height: 35,
                                          width: 35,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('${item.name}')
                                        // Text(service!.data![0][index].name.toString())
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                FutureBuilder<CategoryServiceListModel>(
                    future:
                        categoryServiceList.getCategoryServiceList(position),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data!.data![0].isNotEmpty) {
                        return categorizedWidget(snapshot.data!);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Text('No Data Found!'),
                        );
                      }
                    }),
              ],
            );
          } else {
            return SizedBox();
          }
        });
  }

  Widget categorizedWidget(item) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: item.data[0].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TaskPage(ServiceId: item.data![0][index].id)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.network(
                            item.data[0][index].imageName != null
                                ? item.data[0][index].imageName.toString()
                                : item.misc!.imagePlaceholder.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 8, right: 8, bottom: 5),
                              child: TextInput(
                                  colorOfText: Colors.white,
                                  maxlines: true,
                                  size: 15,
                                  text1: item.data![0][index].taskTitle!
                                      .toUpperCase()),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ));
  }
}
