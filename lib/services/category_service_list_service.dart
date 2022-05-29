import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class CategoryServiceListService {
  List categoryServiceList = [];
  Future<CategoryServiceListModel> getCategoryServiceList(int value) async {
    var response = await http.get(Uri.parse(
        'https://volunteer.cyberfort.co.in/api/servicesByCategory/$value'));
    Map<String, dynamic> map = json.decode(response.body);

    // print(map);
    // var categoryService = map['data'];
    // print(categoryService);
    // print(categoryService[0]);
    // categoryServiceList =
    //     categoryService[0].map((entry) => (entry['task_title'])).toList();

    // print(categoryServiceList);
    // setState(() {
    //   joji1.add(joji);
    // });

    var data = jsonDecode(response.body);
    return CategoryServiceListModel.fromJson(data);
  }
}
