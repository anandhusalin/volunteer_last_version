import 'dart:convert';

import '../model/view_all_service_model.dart';
import 'package:http/http.dart' as http;

class ViewAllServices {
  List viewAll = [];
  Future<ViewAllModel> getDataViewAll() async {
    var response = await http
        .get(Uri.parse("https://volunteer.cyberfort.co.in/api/services"));
    Map<String, dynamic> map = json.decode(response.body);

    var view = map['data'];
    print(view);
    viewAll = view[0].map((entry) => (entry['task_title'])).toList();

    var data = jsonDecode(response.body);
    return ViewAllModel.fromJson(data);
  }
}
