import 'dart:convert';

import 'package:bloc_volunteer_service/model/login_model.dart';
import 'package:bloc_volunteer_service/model/login_response.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<LoginResponse> login(LoginRequestModel loginModel) async {
    final response = await http.post(
      Uri.parse('https://volunteer.cyberfort.co.in/api/login'),
      body: jsonEncode(
        loginModel.toJson(),
      ),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
    );

    var data = jsonDecode(response.body);
    print(response.body);
    print("response");
    print(response.body);

    if (response.statusCode == 200 && data['message'] == null) {
      return LoginResponse.fromJson(data);
    } else {
      return LoginResponse.fromJson({'data': null, 'message': 'message'});
    }
  }
}
