import 'package:bloc_volunteer_service/model/view_all_service_model.dart';
import 'package:bloc_volunteer_service/presentaion/nottifications/text_input.dart';
import 'package:bloc_volunteer_service/presentaion/widgets/chat.dart';
import 'package:bloc_volunteer_service/services/apiService.dart';
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
  Widget build(BuildContext context) {
    return FutureBuilder<ViewAllModel>(
        future: viewAllService.getDataViewAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.data![0];
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  print(data[index].user);
                  if (data[index].user == false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskPage(
                                  ServiceId: data[index].id,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Chat(
                                  serviceId: data[index].id,
                                  serviceTitle: data[index].taskTitle,
                                )));
                  }
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
                          data[index].imageName != null
                              ? data[index].imageName.toString()
                              : snapshot.data!.misc!.imagePlaceholder
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
                                text1: data[index].taskTitle!.toString()),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
