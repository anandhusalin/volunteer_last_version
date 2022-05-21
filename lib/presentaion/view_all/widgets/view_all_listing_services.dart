import 'package:bloc_volunteer_service/model/view_all_service_model.dart';
import 'package:bloc_volunteer_service/presentaion/nottifications/text_input.dart';
import 'package:flutter/material.dart';

import '../../../services/view_all_service.dart';
import '../../service_info/screen_service_info.dart';

class ViewAllServiceList extends StatefulWidget {
  const ViewAllServiceList({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAllServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ViewAllServiceList> {
  final ViewAllServices viewAllService = ViewAllServices();
  bool isLoading = true;

  ViewAllModel? _viewAllModel;
  List viewAll = [];

  @override
  void initState() {
    super.initState();
    viewAllService.getDataViewAll().then((value) {
      setState(() {
        _viewAllModel = value;

        isLoading = false;

        print("service");

        print(_viewAllModel!.data![0][0].imageName);
        print("service");
        viewAll = viewAllService.viewAll;
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
            itemCount: viewAll.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskPage(
                                ServiceId: _viewAllModel!.data![0][index].id,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Column(children: [
                      Expanded(
                        flex: 3,
                        child: Image.network(
                          _viewAllModel!.data![0][index].imageName != null
                              ? _viewAllModel!.data![0][index].imageName
                                  .toString()
                              : _viewAllModel!.misc!.imagePlaceholder
                                  .toString(),
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.home);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 3),
                            child: TextInput(
                                colorOfText: Colors.white,
                                maxlines: true,
                                size: 13,
                                text1: _viewAllModel!.data![0][index].taskTitle!
                                    .toString()),
                          ),
                        ),
                      )
                    ]),
                  ),
                )));
  }
}
