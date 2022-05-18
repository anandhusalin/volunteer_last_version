import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/service_info_model.dart';

class ServiceInfoService {
  List serviceList = [];

  Future<ServiceInfoModel> getServiceInfo() async {
    var response = await http
        .get(Uri.parse("https://volunteer.cyberfort.co.in/api/serviceInfo/3"));

    print(".........................................");
    print(response.body);
    print(".....................END.............");

    Map<String, dynamic> map = json.decode(response.body);

    var service = map['data'];

    var data = jsonDecode(response.body);

    return ServiceInfoModel.fromJson(data);
  }
}
