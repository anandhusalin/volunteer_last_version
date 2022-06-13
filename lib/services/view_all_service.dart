import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../model/view_all_service_model.dart';
import 'package:http/http.dart' as http;

class ViewAllServices {
  List viewAll = [];
  final box = GetStorage();
  Future<ViewAllModel> getDataViewAll() async {
    String token = await box.read('Token');
    var response = await http.get(
      Uri.parse("https://volunteer.cyberfort.co.in/api/services"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      },
    );
    Map<String, dynamic> map = json.decode(response.body);
    print(map);

    var view = map['data'];
    viewAll = view[0].map((entry) => (entry['task_title'])).toList();

    var data = jsonDecode(response.body);
    return ViewAllModel.fromJson(data);
  }
}
