import 'dart:convert';
import 'package:bloc_volunteer_service/model/service_response.dart';
import 'package:bloc_volunteer_service/model/services_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ServicesService {
  final box = GetStorage();

  Future<ServiceResponse> addForm(ServiceModel serviceModel) async {
    print(".......................TOKEN...............");

    String token = await box.read('Token');
    print(token);
    print("bodydata********************");
    print(jsonEncode(serviceModel.toJson()));

    final response = await http.post(
      Uri.parse('https://volunteer.cyberfort.co.in/api/save-service'),
      body: jsonEncode(
        serviceModel.toJson(),
      ),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      },
    );
    print(".........................Token..........end..........");
    print("token");
    print(box.read("Token"));
    print("hello");
    print(response.body);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200 && data['status'] == null) {
      return ServiceResponse.fromJson(data);
    } else {
      return ServiceResponse.fromJson(
          {'data': null, 'message': data['message'], 'status': 'status'});
    }
  }
}
