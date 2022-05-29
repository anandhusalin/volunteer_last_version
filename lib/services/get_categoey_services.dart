import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/service_bycategory_model.dart';

class GetServiceByCategoryServices {
  List Categories = [];
  Future<GetServiceByCategoryModel> getDataCategories() async {
    var response = await http
        .get(Uri.parse('https://volunteer.cyberfort.co.in/api/getCategories'));
    Map<String, dynamic> map = json.decode(response.body);

    // print(map);
    // var cate = map['data'];
    // print(cate);
    // print(cate[0]);
    // // Categories = cate[0].map((entry) => (entry['name'])).toList();

    // print(Categories);

    var data = jsonDecode(response.body);
    return GetServiceByCategoryModel.fromJson(data);
  }
}
