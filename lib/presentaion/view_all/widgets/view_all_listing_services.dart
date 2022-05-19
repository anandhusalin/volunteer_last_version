import 'package:flutter/material.dart';

import '../../../model/view_all_service_model.dart';
import '../../../services/view_all_service.dart';
import '../../nottifications/text_input.dart';
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
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: viewAll.length,
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
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
                    height: 150,
                    child: Row(children: [
                      SizedBox(
                        child: Image.network(
                            _viewAllModel!.data![0][index].imageName != null
                                ? _viewAllModel!.data![0][index].imageName
                                    .toString()
                                : _viewAllModel!.misc!.imagePlaceholder
                                    .toString()),
                      ),
                      Expanded(
                        child: TextInput(
                            colorOfText: Colors.blue,
                            maxlines: true,
                            size: 25,
                            text1: _viewAllModel!.data![0][index].taskTitle!
                                .toString()),
                      )
                    ]),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        image: const DecorationImage(
                            image: AssetImage("images/1.jpg"),
                            fit: BoxFit.cover)),
                  ),
                )
                // Column(
                //   children: [
                //     Container(
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.grey),
                //           borderRadius: const BorderRadius.only(
                //             topLeft: Radius.circular(10),
                //             topRight: Radius.circular(10),
                //           )),
                //       height: 147,
                //       width: 160,
                //       child: Image.network(
                //           service!.data![0][index].imageName != null
                //               ? service!.data![0][index].imageName.toString()
                //               : service!.misc!.imagePlaceholder.toString()),
                //     ),
                //     Container(
                //       height: 48,
                //       width: 160,
                //       decoration: const BoxDecoration(
                //           color: primaryColor,
                //           borderRadius: BorderRadius.only(
                //               bottomLeft: Radius.circular(10),
                //               bottomRight: Radius.circular(10))),
                //       child: Center(
                //           child: Padding(
                //         padding: const EdgeInsets.all(5.0),
                //         child: Text(
                //           service!.data![0][index].taskTitle.toString(),
                //           maxLines: 2,
                //           style: const TextStyle(
                //               color: Colors.white, fontSize: 15),
                //         ),
                //       )),
                //     )
                //   ],
                // ),
                ));
  }
}
