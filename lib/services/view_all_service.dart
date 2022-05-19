import 'dart:convert';

import '../model/view_all_service_model.dart';
import 'package:http/http.dart' as http;

class ViewAllServices {
  List viewAll = [];
  Future<ViewAllModel> getDataViewAll() async {
    var response = await http
        .get(Uri.parse("https://volunteer.cyberfort.co.in/api/services"));
    Map<String, dynamic> map = json.decode(response.body);
    print(map);

    var view = map['data'];
    viewAll = view[0].map((entry) => (entry['task_title'])).tolist();

    var data = jsonDecode(response.body);
    return ViewAllModel.fromJson(data);
  }
}
