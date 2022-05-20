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
  //  final GetServiceByCategoryServices _getservices =
  //      GetServiceByCategoryServices();
  final GetServiceByCategoryServices categoryService =
      GetServiceByCategoryServices();
  bool isLoading = true;

  GetServiceByCategoryModel? service;
  List categories = [];
  @override
  void initState() {
    super.initState();
    categoryService.getDataCategories().then((value) {
      print('value');
      print(value);
      setState(() {
        service = value;
        isLoading = false;
        categories = categoryService.Categories;
      });
    });
  }

  int position = 0;
  List<ListItem> listItem = [
    ListItem(
        isSelected: true, icon: FontAwesomeIcons.school, tiitle: " Social "),
    ListItem(isSelected: false, icon: Icons.forest, tiitle: " Environment"),
    ListItem(
        isSelected: false, icon: FontAwesomeIcons.hospital, tiitle: "Medical"),
    ListItem(
        isSelected: false, icon: FontAwesomeIcons.flag, tiitle: " Political"),
    ListItem(
        isSelected: false, icon: Icons.family_restroom, tiitle: " Charity"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(service!.data![0][2].name.toString()),
        // Text(categoryService!.data![0].toString()),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listItem.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          for (int i = 0; i < listItem.length; i++) {
                            setState(() {
                              position = index;
                              if (index == i) {
                                listItem[index].isSelected = true;
                              } else {
                                listItem[i].isSelected = false;
                              }
                            });
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: listItem[index].isSelected
                                ? primaryColor
                                : backgroundColor,
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Icon(listItem[index].icon),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(listItem[index].tiitle)
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

        Visibility(
          child: CategoryServiceList(
            number: position + 1,
          ),
          visible: position != -1 && position == 0,
        ),

        Visibility(
            visible: position != -1 && position == 1,
            child: CategoryServiceList(
              number: position + 1,
            )),
        Visibility(
            visible: position != -1 && position == 2,
            child: CategoryServiceList(
              number: position + 1,
            )),
        Visibility(
            visible: position != -1 && position == 3,
            child: CategoryServiceList(
              number: position + 1,
            )),
        Visibility(
          visible: position != -1 && position == 4,
          child: CategoryServiceList(
            number: position + 1,
          ),
        ),
        Visibility(
            visible: position != -1 && position == 5,
            child: CategoryServiceList(
              number: position + 1,
            )),
        Visibility(
            visible: position != -1 && position == 6,
            child: CategoryServiceList(
              number: position + 1,
            )),
      ],
    );
  }
}

class ListItem {
  String tiitle;
  IconData icon;
  bool isSelected;
  ListItem(
      {required this.icon, required this.tiitle, required this.isSelected});
}

class CategoryServiceList extends StatefulWidget {
  final int number;
  const CategoryServiceList({
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryServiceList> createState() => _CategoryServiceListState();
}

class _CategoryServiceListState extends State<CategoryServiceList> {
  final CategoryServiceListService categoryService =
      CategoryServiceListService();
  bool isLoading = true;

  CategoryServiceListModel? categoryServiceListModel;
  List categoryServiceList = [];

  @override
  void initState() {
    super.initState();

    categoryService.getCategoryServiceList(widget.number).then((value) {
      setState(() {
        categoryServiceListModel = value;

        isLoading = false;

        categoryServiceList = categoryService.categoryServiceList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categoryServiceList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskPage()));
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
                                categoryServiceListModel!
                                            .data![0][index].imageName !=
                                        null
                                    ? categoryServiceListModel!
                                        .data![0][index].imageName
                                        .toString()
                                    : categoryServiceListModel!
                                        .misc!.imagePlaceholder
                                        .toString(),
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
                                      text1: categoryServiceListModel!
                                          .data![0][index].taskTitle!
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
