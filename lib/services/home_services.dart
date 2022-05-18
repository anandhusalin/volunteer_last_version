import 'dart:convert';

import 'package:bloc_volunteer_service/model/home_screen_model.dart';
import 'package:http/http.dart' as http;

class PopularServiceService {
  List joji = [];
  Future<PopularServiceModel> getData() async {
    var response = await http.get(
        Uri.parse('https://volunteer.cyberfort.co.in/api/popularServices'));
    Map<String, dynamic> map = json.decode(response.body);

    print(map);
    var jo = map['data'];
    print(jo);
    print(jo[0]);
    joji = jo[0].map((entry) => (entry['task_title'])).toList();

    print(joji);
    // setState(() {
    //   joji1.add(joji);
    // });

    var data = jsonDecode(response.body);
    return PopularServiceModel.fromJson(data);
  }
}
